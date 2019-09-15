Class snext.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="snext.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="File Batch - Expedition" Category="categorization" ClassName="EnsLib.RecordMap.Service.BatchFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BatchClass">snext.categorization.ExpeditionRMBatch</Setting>
    <Setting Target="Host" Name="RecordMap">snext.categorization.ExpeditionRM</Setting>
    <Setting Target="Host" Name="TargetConfigNames">ExpeditionRuleSet</Setting>
    <Setting Target="Adapter" Name="FilePath">/durable/samples/in/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.samples</Setting>
  </Item>
  <Item Name="ExpeditionRuleSet" Category="categorization" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">snext.categorization.Rule.ExpeditionRuleSet</Setting>
  </Item>
</Production>
}

}
