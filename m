Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20DB372698;
	Sun, 10 May 2026 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410115; cv=none; b=piw2BLUR1nGz748xb6I/bU+YqDe2GYhG1Mx2VkWTbDlvNx3UVkxwLRdaChTT//h3pFbLPclG6bbLQfasnfMQxsJeUCuDX3fGWyl3ywdDd0fL2iErhBgkdt3SrPh5ZyOH7bOcZGkpN0BQu/YKtLg7Qo4HBFXN4BPOk0FfjtNVHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410115; c=relaxed/simple;
	bh=uMx4jqWM8TuPHyt/kUuU0uJ9ea4uC1/m5zNr0ebXMlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XJYfX53FlVy3Zo2tFue/g66hsozWL4v5oopwbJlkazovPt60XwZSYecSjBjt72JfTLr/LxaLwDQIopDENAQoh3nS59xDO2YIi3CduNnuKqtfqBKdVzePvmYddLJzm3Q8cYdBIRiCj03N+TbKaZHKnqLVzzeb2eMDkNzC0Gk67K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6ZxZ8xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6ZxZ8xm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F27DC2BCB8;
	Sun, 10 May 2026 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410115;
	bh=uMx4jqWM8TuPHyt/kUuU0uJ9ea4uC1/m5zNr0ebXMlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=p6ZxZ8xmzKUUWXMPeXKr2HIBjeJdcsbL6TYus3ZLa4+1Zh+KYXeudfOu+NbIC37MU
	 PLkMbPxAXIyiFZGINlTtS8MLkUSIoNWpiTpSehCGQLiU8Zi+qHQLOxlo/H7NryJcpm
	 15wJqB4mIb4foT0UpwrGI8/0sPZn/MXjS7srO1dlCYjA6dKPQE7T0Gs80KNAKyrGBk
	 8GYbUxVt6Wco7cim6hLluPJNf9k4LYgDSOdsHQjxCe1b+0tlNMxoM0dRXK1a7Wttw0
	 NwYasQl/hgfC74qBDpCCvav/zSzJIm604kVMizEvTTUY7XAd6eIO19rwLJiX9DhSDO
	 BUwOudlxTVHcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 07/15] net: enetc: add support for "Add" and
 "Delete" operations to IPFT
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260509102954.4116624-8-wei.fang@nxp.com>
References: <20260509102954.4116624-8-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:34 +0000
Message-Id: <20260510104835.0F27DC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IPFT Add request specifies the STSE update flag but omits the =
STSE data in its structure, causing hardware to misread the CFGE data.
--

commit 00a023617c26cf31c0233be20200f834604aaeaa
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add support for "Add" and "Delete" operations to IPFT

This patch adds "Add" and "Delete" operations to the ingress port filter=20
table (IPFT) for the ENETC driver. These interfaces allow the driver and=20
switch to classify incoming traffic and apply specific actions based on=20
a precedence value.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/driver=
s/net/ethernet/freescale/enetc/ntmp_private.h
> --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
[ ... ]
> +/* Ingress Port Filter Table Request Data Buffer Format of Update and
> + * Add actions
> + */
> +struct ipft_req_ua {
> +	struct ntmp_cmn_req_data crd;
> +	union ipft_access_key ak;
> +	struct ipft_cfge_data cfge;
> +};
[ ... ]
> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/et=
hernet/freescale/enetc/ntmp.c
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
[ ... ]
> +int ntmp_ipft_add_entry(struct ntmp_user *user,
> +			struct ipft_entry_data *entry)
> +{
[ ... ]
> +	swcbd.size =3D sizeof(*resp);
> +	err =3D ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd(&req->crd, user->tbl.ipft_ver, NTMP_QA_ENTRY_ID,
> +		      NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU);

Does setting the NTMP_GEN_UA_STSEU flag here cause the hardware to expect=20
STSE data in the request buffer?

Looking at ipft_resp_query, the STSE data (__le64 match_count) sits=20
strictly between KEYE and CFGE:

struct ipft_resp_query {
	__le32 status;
	__le32 entry_id;
	struct ipft_keye_data keye;
	__le64 match_count; /* STSE_DATA */
	struct ipft_cfge_data cfge;
} __packed;

However, ipft_req_ua lacks this STSE data field, placing cfge immediately=20
after ak.

Since the hardware parses the buffer sequentially, could this cause it to=20
misinterpret the req->cfge field as STSE data, and subsequently read past=20
the valid data into the zero-initialized tail to populate the actual CFGE=20
data?

If the STSE update is intended, should an STSE field be added to=20
struct ipft_req_ua? Alternatively, should NTMP_GEN_UA_STSEU be removed=20
from the update action flags?

> +	req->ak.keye =3D entry->keye;
> +	req->cfge =3D entry->cfge;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D7
