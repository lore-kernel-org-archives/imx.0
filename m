Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969313064B2
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730682; cv=none; b=iUVBlt2Go7C1HnlUiXWMYTA7sHxw+muS0+a88xSML4NrD88T02eDgVvF8GeBVR+TvcgwRDu+I4zaBtP3qBmYa0X4d6d3wGXT3KzUw9QKW4XmYWLHYty82Dgh2F88Vaqukl1SZ8v+MoboHJy11VR+HrGIrYnqFe9NuVRSQBASMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730682; c=relaxed/simple;
	bh=Sz6nsRkmRTeAjj/tVUXh/HgceLr1i8o5uzdaw4EVZZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SKqTH/MDx89ygSBTaNcDzlo8rcTfQITajCqDCCp6spE3YaOQayoyaT9UmOB7SXdZ8PlIk2dfycWD2plSi0+rHSCMtG59vo1Qgz8Qa6SZbgB5EmAW6b8zZNoIKPkl6bzd+CIHFb5qAmQwE+/Bx2NPq/belWbwWPl0wVcFQJHoJfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRpciJw8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRpciJw8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB8D1F00898;
	Sat,  6 Jun 2026 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730681;
	bh=T+35h2gNipkg43fHBcKpO7vbYgE5rQa4yaD57atis8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fRpciJw8iHeUHhma8oa/AcurID04uxch/OiH2V9otNjTG7oEtCeIutHjJn3998lv1
	 gtny4hOAKBIDnHbfnQs979lkwn7fyhEdhNr7HnowXe8Xy8msfG6bHf3fhRGrt+Zf8z
	 G+XBTtigPIKEavBcYH//AWtf/EC+hR+ta2uX+3TI6+84qAoEa4TxwMJfvS3ZTxXSuk
	 0mc5BWpJ1sGH4rrx25qoNj8XGRBi/KsWciHwJQ/YyPBbrnEt63jGWSlR3gQOPdblnF
	 o8dGR3Kgyz2c5qY1pcZqVlZMFJQV4f/sWui1AZ4aBmwdoLQCvX13RqoJQHAxhb5Rw5
	 RHl3xhAFnbzPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 09/15] net: enetc: add MAC address filtering
 support for VFs of ENETC v4
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605065550.3038579-10-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-10-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:40 +0000
Message-Id: <20260606072441.4BB8D1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] A Time-Of-Check to Time-Of-Use (TOCTOU) race condition in `enetc_m=
sg_handle_rxmsg` allows a malicious VF to trigger a heap out-of-bounds read=
 in `enetc_msg_set_vf_mac_hash_filter` by changing the message length betwe=
en allocation and use.
--

commit 46d6bb311e4a8bcc15dcd4d622db8e4c46a5ec75
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add MAC address filtering support for VFs of ENETC v4

Adds VSI-to-PSI mailbox message support to allow VFs to request MAC filter
configuration from the PF on ENETC v4. Introduces two new command IDs to
program the MAC hash filter table and configure promiscuous mode.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index 49c1ca14735c9..7dcb1dcdec84d 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -101,6 +101,115 @@ static u16 enetc_msg_set_vf_primary_mac_addr(struct=
 enetc_pf *pf, int vf_id,
[ ... ]
> +static u16 enetc_msg_set_vf_mac_hash_filter(struct enetc_pf *pf, int vf_=
id,
> +					    void *vf_msg)
> +{
[ ... ]
> +	} else if (type =3D=3D ENETC_MAC_FILTER_TYPE_ALL) {
> +		if (!msg->hdr.len) {
> +			pf_msg =3D FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> +					    ENETC_MSG_CLASS_ID_INVALID_MSG_LEN);
> +			goto vf_state_unlock;
> +		}
> +
> +		pf->ops->set_si_mac_hash_filter(hw, si_id, UC, hash_tbl);
> +		hash_tbl =3D (u64)msg->hash_tbl[3] << 32 | msg->hash_tbl[2];

[Severity: High]
Can a malicious VF trigger a heap out-of-bounds read here?

Looking at enetc_msg_handle_rxmsg(), which handles the message allocation, =
it
reads msg_hdr->len from DMA memory to calculate the size:

    u32 msg_size =3D ENETC_MSG_SIZE(msg_hdr->len);
    ...
    msg =3D kzalloc_objs(*msg, msg_size);
    ...
    memcpy(msg, msg_swbd->vaddr, msg_size);

If the VF modifies the length in DMA memory to a non-zero value between the
msg_size calculation and the memcpy, the copied msg->hdr.len will differ fr=
om
the size actually allocated.

If the buffer was allocated as 32 bytes (because the initial length was 0),
this check for !msg->hdr.len will pass, and the subsequent read of
msg->hash_tbl[3] (at offset 32) will read out of bounds.

If this object is placed at the end of a slab page next to an unmapped page,
could this cause a panic, leading to a guest-to-host denial of service?
Additionally, would the leaked kernel heap data be programmed into the MAC =
hash
filter, potentially creating an information leak?

> +		pf->ops->set_si_mac_hash_filter(hw, si_id, MC, hash_tbl);
> +	}
> +
> +vf_state_unlock:
> +	mutex_unlock(&vf_state->lock);
> +
> +	return pf_msg;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D9
