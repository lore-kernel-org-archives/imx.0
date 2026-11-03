Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728648;
	b=cVwB2QCwaOxBrnIQ3Q8OilTQKEKkrWoEa9XRAI/Mgw3CzOHq/66+HOXb09TXhNyqv/pS
	 uvwxuAdhdX9i8r2osBblIIgWlzt5LNevgoaIiPJhn0SFFXNAB28nMSBpQtn7fJk9/WrpN
	 6vVe8+Ha67ltlQ/kbDPu0dz4SaA0YUKmhfkEMuwxHqMUB45f49paZDB22pqS9ufP9nUla
	 3P/y753TYGBdLjPfR6uWTliZT1hm/4fS1b08zT1GKUYlGyNHpz2EjukMTVY3iT61pg/87
	 H8N7S51+9MKat+JHwJHS4v5GWsIeNVd6E1n0/gfbFys41/4ehiNRjOG83v+ev5oCOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=huPTPHyj739fiAid2QA4LZrf2KE7+U9NxU9Pc0EOceI=;
	b=qq1LvyUa6xKa4PPJCasWqmiHlnYzbOBUWhl71kwLjMr2jjXf9odYPPeHigQbeoph0kyV
	 DMc1r4jSL7U5SVfNz78b7vV3ZWhRrBso65xP5zsH2mfsml1KLwKeTs9I+c7A9FgBYqQ3z
	 txuYr6NSP/HTb++4z9P3DTs/hAC6ciEDinD/HnEmLruUAU9jj9tE4QfzX6Bv5P+5MfbD/
	 sxrVH8YcUjY/ivNd469AP0jLBY+q0Wrd4ZbaF/BpKemoTUOU0qpPFjIu5Ze3UpGrBP48r
	 KvFwtar5RBTeQDXzje/mKC9VpRvu7zW9lSncKixvAk0khleWWCojxYRGgBY0fDkeXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=kz7QtwZg;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5666C606A32F
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 17:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5666C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=kz7QtwZg
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJx9g5s9Gz1XLktx;
	Tue,  3 Nov 2026 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793728641; x=1796320642; bh=huPTPHyj739fiAid2QA4LZrf
	2KE7+U9NxU9Pc0EOceI=; b=kz7QtwZgvIkdgq1Q/SyonKRrUFzGijm8PvxhVoQB
	ojEM1Hs/BO+gJVZZ2IIcEckk5bR4Ob5f3yHayTquilHwJcTqSt6Ps9XxQvPAbaSo
	cbQi4cjx+h03hoKC8KvQg4GGrXTJj160ZT5KnQ9xgNZm2iLeebBYOhwQan1C3Kz5
	QDKGSCgxB6Cy7tBipZ2ShftwVD86GG/6wF1Z9BOCbNyRV8S3x/M8uaDwiT26R3BF
	KCydXXOjt3HZVBu2/R8zukAA0nU5nWQqSUGLYXxTWKxswrHWLo6SOrf/IAct/R/6
	5ZbyntzH1ngmf1f5XYoBRgakL1vK4Iovfq13mDAm53tKkA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ozLDpqkHbJhh; Tue,  3 Nov 2026 17:57:21 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJx9X0ml1z1XLkvj;
	Tue,  3 Nov 2026 17:57:20 +0000 (UTC)
Message-ID: <444b8e4d-948a-48de-b40e-74246b849842@acm.org>
Date: Tue, 3 Nov 2026 09:57:19 -0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/11] ufs: s32n7: Add NXP S32N79 UFS host controller
 driver
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Pedro Sousa <pedrom.sousa@synopsys.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Can Guo <quic_cang@quicinc.com>,
 Asutosh Das <quic_asutoshd@quicinc.com>
Cc: imx@lists.linux.dev, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, Frank Li <Frank.Li@nxp.com>
References: <20261103133215.1385823-1-larisa.grigore@oss.nxp.com>
 <20261103133215.1385823-11-larisa.grigore@oss.nxp.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261103133215.1385823-11-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 11/3/26 5:32 AM, Larisa Grigore wrote:
> Add support for the UFS host controller on the NXP S32N79 SoC, built on
> the Synopsys DesignWare (DWC) UFS architecture, using the UFSHCD DWC an=
d
> UFSHCD platform glue.

The following comments posted on v9 have not yet been addressed:
* device_get_match_data() is still called in both ufs_s32n7_probe() and
   ufs_s32n7_init(). Since all S32N7 variants use the same vops callbacks
   (or vops can be embedded in struct s32n7_soc_data and recovered via
   container_of(hba->vops, ...)), one lookup suffices.
* ufs_s32n7_link_startup_post_change() still open-codes a local-only
   subset of ufshcd_dwc_connection_setup() (setting N_DEVICEID =3D 0
   without N_DEVICEID_VALID, and skipping peer attributes). The v10
   commit message states this "follows the Synopsys recommended
   sequence", but still does not explain why
   ufshcd_dwc_connection_setup() (used by ufs-amd-versal2.c) cannot be
   used on S32N79.

Other issues:
* Back-to-back writes to SCM_STATUS: ufs_s32n7_link_startup_pre_change()
performs two consecutive posted writel() calls to ufs->reg_scm +
SCM_STATUS (SCM_STATUS_PHY_RESET(1) immediately followed by
SCM_STATUS_PHY_RESET(1) | SCM_STATUS_SRAM_BYPASS(1)) with no readback or
delay in between. Either the first write is redundant, or if the
hardware requires observing SRAM_BYPASS =3D 0 while PHY_RESET =3D 1, a
readback/delay is missing and should be documented.
* Magic hex constants for shared DWC M-PHY bitfields:
s32n79_reset_config, s32n79_calib_mphy_disabled,
s32n79_calib_mphy_enabled, and pwr_change_phy_regs use raw hex values
(0x8A for CBREFCLKCTRL2 even though ufshcd-dwc.h already defines
CBREFREFCLK_GATE_OVR_EN, plus 0x4, 0x100, 0xc, 0x8). ufs-amd-versal2.c
already defines MPHY_FAST_RX_AFE_CAL, MPHY_FW_CALIB_CFG_VAL,
MPHY_RX_OVRD_EN, and MPHY_RX_OVRD_VAL for these same registers=E2=80=94mo=
ving
those bit macros to ufshcd-dwc.h would avoid magic numbers.
  Thanks,

Bart.
