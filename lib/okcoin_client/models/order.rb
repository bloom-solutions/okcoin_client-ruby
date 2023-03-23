module OkcoinClient
  class Order

    include Virtus.model

    REMOTE_ATTR_TO_LOCAL_MAP = {
      accFillSz: :acc_fill_sz,
      avgPx: :avg_px,
      cTime: :c_time,
      category: :category,
      ccy: :ccy,
      clOrdId: :cl_ord_id,
      fee: :fee,
      feeCcy: :fee_ccy,
      fillPx: :fill_px,
      fillSz: :fill_sz,
      fillTime: :fill_time,
      instId: :inst_id,
      instType: :inst_type,
      lever: :lever,
      ordId: :ord_id,
      ordType: :ord_type,
      pnl: :pnl,
      posSide: :pos_side,
      px: :px,
      rebate: :rebate,
      rebateCcy: :rebate_ccy,
      reduceOnly: :reduce_only,
      side: :side,
      slOrdPx: :sl_ord_px,
      slTriggerPx: :sl_trigger_px,
      slTriggerPxType: :sl_trigger_px_type,
      source: :source,
      state: :state,
      sz: :sz,
      tag: :tag,
      tdMode: :td_mode,
      tgtCcy: :tgt_ccy,
      tpOrdPx: :tp_ord_px,
      tpTriggerPx: :tp_trigger_px,
      tpTriggerPxType: :tp_trigger_px_type,
      tradeId: :trade_id,
      uTime: :u_time
    }

    attribute :raw_hash, Hash

    REMOTE_ATTR_TO_LOCAL_MAP.each do |remote_attr_name, local_attr_name|
      attribute local_attr_name, String, default: :"default_#{local_attr_name}"

      define_method :"default_#{local_attr_name}" do
        raw_hash[remote_attr_name.to_s]
      end
    end

  end
end
