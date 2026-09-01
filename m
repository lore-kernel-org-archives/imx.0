Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B853A0E8E
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250828; cv=none; b=JUn0K7i5iS+DpGaBX3yZYAGOOdWCQ9fhfzpmgGJgY0K4SOvUFxa0W8UzHBTRBy8FK0+2RbHIWwokaZlpSG34zie8I8wsafENtxmwP5jIA+lAuZad0BXS4h0imEGZ3Js76XF5YXYsneotuxK1s3DVLJa+Ftt0exjwR3p4OxPZ9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250828; c=relaxed/simple;
	bh=Zy0w6WNm9dNYqFU8MZRAYdVf7WJHRbcoCTxKlz3MEfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DviME+OyvLiWn3fzhIdMc+uAOkscmMaaoF0TpBmoxAmrGDhBXK0KGDGtLpbESbs1zaFShQ9voqOj4lLqTrEbMeNH+nGbro5iypQ8uQE15fasyDDGTVHuszmcU4g4VAMoaDHeBSc7k7keTuUkfQVjI5okE+A8KBBylRXGL74FLsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXNlVuW3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXNlVuW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3911F00A3E;
	Tue,  1 Sep 2026 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250826;
	bh=wfmQv9HZNeH5ueRgorECK6yQQxAFaj+q0dL2O+NjXnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PXNlVuW3Bwg61DK6QpPl1WP/QdaZPo3YuHgY93kLnnz+KJ4QLcxMW2IpnZLROH4RA
	 Ut6nQztqaEnZEdERC14Eau5a6eDCFCImZGmh1YN8NsphiQXNYuXyFcete40PdEohjn
	 6+huZpo8rvIW5/7eZ+T8z0RmXSDk0UL1T0C9cRrKGUNETJgtNWmncvEZgIQLJ4EUQ0
	 gEuYkIBzF7xTQIZ8YUZ3gaW3y2/LTDvwYqwb3aRjILhiTBYePVmPI4J7448KiCB3vQ
	 pgYTmUWZ/mEgQgDyEGYA0WwjzcDr8usovLj3S9t5ujJ/x5RLwMDbeJPr9JUX1I06dt
	 /7GBT3swb3hOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 7/8] net: dsa: netc: add PTP two-step
 timestamping support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831082335.1184605-8-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
 <20260831082335.1184605-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:20:26 +0000
Message-Id: <20260901082026.7F3911F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing NULL check for `tagger_data` in `netc_twostep_tstamp_proce=
ss` can cause a kernel panic if a packet is received during or after teardo=
wn.
--

commit 148461a2244d72398b05dc311c1c2fbd45e48502
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add PTP two-step timestamping support
   =20
This commit adds two-step TX timestamping and RX timestamping for the NETC
switch. It installs ingress port filter table (IPFT) rules for RX and
configures switch tags to capture timestamp responses for the TX path.

> diff --git a/net/dsa/tag_netc.c b/net/dsa/tag_netc.c
> index df72a61796ad5..d46576ae2f751 100644
> --- a/net/dsa/tag_netc.c
> +++ b/net/dsa/tag_netc.c
[ ... ]
> +static void netc_twostep_tstamp_process(struct netc_tag_th_subtype2 *tag,
> +					struct sk_buff *skb)
> +{
> +	u8 ts_req_id =3D FIELD_GET(NETC_TAG_TS_REQ_ID, tag->hr_tsreq_id);
> +	struct dsa_port *dp =3D dsa_user_to_port(skb->dev);
> +	u64 ts =3D get_unaligned_be64(&tag->timestamp);
> +	struct netc_tagger_data *tagger_data;
> +	struct dsa_switch *ds =3D dp->ds;
> +
> +	tagger_data =3D ds->tagger_data;
> +	if (unlikely(!tagger_data->twostep_tstamp_handler))

[Severity: High]
Can tagger_data be NULL here, leading to a kernel panic?

In the DSA teardown sequence (dsa_tree_teardown()),
dsa_switch_teardown_tag_protocol() is called first, invoking
netc_disconnect() which frees ds->tagger_data and sets it to NULL.

However, the conduit device's rx_handler is not removed until
dsa_tree_teardown_conduits() is called later. If a hardware-generated To_Ho=
st
subtype 2 response arrives in this window, the conduit's rx_handler will
still invoke netc_rcv(), eventually calling netc_twostep_tstamp_process().
This would result in a NULL pointer dereference when evaluating
!tagger_data->twostep_tstamp_handler.

Note that a follow-up patch (8/8) introduces a similar unchecked dereference
in netc_onestep_sync_enqueue(), so this issue might still be present at the
end of the series.

> +		return;
> +
> +	tagger_data->twostep_tstamp_handler(ds, dp->index, ts_req_id, ts);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831082335.1184=
605-1-wei.fang@oss.nxp.com?part=3D7
