/// 
Class snext.categorization.bp.importShipment Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='snext.categorization.ExpeditionRM.Record' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='productID' type='%BigInt' initialexpression='0' instantiate='0' />
<property name='productLabel' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='2000' />
</parameters>
</property>
<property name='shipment' type='snext.categorization.data.Shipment' instantiate='1' />
</context>
<sequence xend='200' yend='1050' >
<sql name='Get Product' xpos='200' ypos='250' >
<![CDATA[select
%ID, ProductLabel
INTO :context.productID, :context.productLabel
FROM snext_masterdata.Product
WHERE ProductCode = :request.ProduitCode]]>
</sql>
<if name='=Label?' condition='context.productID &amp;&amp; (context.productLabel &apos;= request.ProduitDesignation)' xpos='200' ypos='350' xend='200' yend='950' >
<annotation><![CDATA[Product exists with same Label ?]]></annotation>
<true>
<transform name='shipment' class='snext.categorization.dt.ExpeditionRMToShipment' source='request' target='context.shipment' xpos='200' ypos='500' disabled="true"/>
<sql xpos='200' ypos='600' disabled="true"/>
</true>
<false>
<if name='Exist?' condition='context.productID' xpos='470' ypos='500' xend='470' yend='850' >
<annotation><![CDATA[Product exists?]]></annotation>
<true>
<call name='Product Validation' target='Product Manager' async='1' xpos='740' ypos='650' >
<request type='EnsLib.Workflow.TaskRequest' />
<response type='EnsLib.Workflow.TaskResponse' />
</call>
<sync name='Retour Workflow' calls='Product Validation' type='all' xpos='740' ypos='750' />
</true>
<false>
<empty xpos='470' ypos='650' />
</false>
</if>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
