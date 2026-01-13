Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126692512C8
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324044; cv=none; b=n/LK087sVSZ7GGsBlLFC85ZYZa4SXROUjZTeq90awNo3ucl+jKYlOGy1DGzPrFOlz4Xp3u4r08dCphX68T6X3O09eFc+/qFcC3K/xkK8sz8tYBKfeK3vYiP2U90iZrC2VWLULDNzfWOn2dhVYEaymvIi6G8cpc5kbAAPaW1nOHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324044; c=relaxed/simple;
	bh=VKQO1dvhlSzjN1XUqKBcYefeEELarKqe4KTlZLk2ixM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWgPNOtd4RIdVrShaIkyVvFeRbmC3n2jzMQHWXzd7l/hw7iEqqzwztgTemwsXbcOMRb3XQv7C4D5Jv6521Bo/kqvvrfEMtilHwd7qeGi/lms7iNjZOC9W27ioqccU9L3bYxA0jWCruasNQ/czd+jYPdS3pt+s7QFiCiPnaJl0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ih+uArxG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ih+uArxG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0bb2f093aso53099875ad.3
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768324039; x=1768928839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=;
        b=Ih+uArxGl410q3afKIynSsI06lC0HgRsd+MEAtMDNijuZ2SCWAuvG05uTAWX1PLMiE
         7prDOM9d5Rv0O0NIjDw76phOMW2eFa/n1ZHSLnibvo9kmBTt4AsDt8Y588WhXUu4Tt4I
         lGUa+5ofdRR/p0A5/YqBro3jkZXpILur/uYJjfYO+HTRZPgeYdarA7lITB845hFFnQQS
         bLd/iqRWYvh5YHgmFgD/e7R1KkwZ+VxNXE5HlX4ujl/VPVvnRA58o8GG86wujJRS53+z
         VTiPYSuFbsiBvMXnJfQy61cnDBZfnV0xYofrGYL2wOXrQO0NJcIfYi/BiK+qrSz/oF9V
         z/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768324039; x=1768928839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7lOqExgMcdugcI9HIbQ5JeCIYCF/f+YAISpiToc7uE=;
        b=BPR34Hj2hqd4ewuQAwPCHchyBxrXspuL6i+jDpmt/vB08kui/bJJ0VA8B9gKunHdYa
         rKYNmdiLMePiDuG0zcx4Dkh8ZFLy9g8zyc4GkpfAPbZm1Oo7ZalzTcGiUTtcL298H3pZ
         XlGlGQ3rM4j+l17Azi/20KDH2nykcUa0yhDiTz1YN9NUIm9v1JwBFlR9bvObcHXH/vwK
         UtvwDVueS7q3qnrxXG4upik9A2lRW2BHKlOieR/fRXS2wpIHP5qMYEcplbsA0y77OE1K
         yIMC3K3qmJsJIURhat+P51v7HWWgxUHsvAZEOaSAxqxZBwl4K5gt5Ib9dSKCtQH+tlAz
         ckMA==
X-Forwarded-Encrypted: i=1; AJvYcCU32dbFNGDIyzApTRHICyW5wpeSiMuEytbI6+9ucbZ28nwOg4vTg2QtQ0z8hxUhZE8RNoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeHT67zQEFyLio7UcX1LSk+eheXUFt4c9ZUVL9azgUqbrw7ke6
	SmpNHoTMbMjOsZEd99FcH2A4/g/BqXsJqpXc+pHkjMiIkFPoRmB4MrmgeQ1e+OBHe6M=
X-Gm-Gg: AY/fxX6D8BVZ/usk9CGXJlff34UrMrrwSRsbl9xtJet4dNIlBCEw95ot3pCjAV28U6o
	8U5FZT5s2UBrnxMT4yVkmSMvxWXCiF91F+x/Kz81GnFbeItqqK9cKwasn+glrOdsaJCpsC0HxRu
	xJGGrSX+7zLarxJs7yNeI4vO+euh+NT2bLrMn+T02C5X3GJiBgh797vAKVu4/r7MBsF863hQOYY
	97sG/nPUlW9gGs4J0NqnxLhyEbk1BQavf2Rw9Yml5qhjoizAWVBk0GOI36qebl2iXhU+6epUcbT
	9HRb0unFoJU7IHNn8S4c9WtJvOT01uIo4JdtaegbX0LOVutHt/yD/oI4uHqrRCe5XYQnNfZSDSp
	J03cunh2LCrsALAKIq2a0lcWZbjHHL6w/vUpMGRI8PyIfyFAJFbIsQEQoJIIuSxQJvCNWDLF8mi
	pBYif7+GvJt62WDQ==
X-Google-Smtp-Source: AGHT+IFOvPJP9R1hw4cpVp6os/r5K7GEms65q/AlzRFH4grW4yqI7xvevFuJtgCcEOr5tWpPHLh0Mg==
X-Received: by 2002:a17:902:ce92:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a3ee4aad5amr188877205ad.32.1768324039181;
        Tue, 13 Jan 2026 09:07:19 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:82f2:906c:a8da:1fdb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3632sm208565395ad.95.2026.01.13.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:07:18 -0800 (PST)
Date: Tue, 13 Jan 2026 10:07:15 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/6] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aWZ7w5g7mYMDoffv@p14s>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>

On Fri, Jan 09, 2026 at 08:08:00PM +0800, Peng Fan (OSS) wrote:
> This patchset is pick up a previous patchset [1] with rebased on
> next-20251030, and some changes applied.
>  - Add runtime ops to separate cpu ops and lmm ops
>  - added more comments
>  - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().
> 
> No changes to the dt-binding patch, so R-b/A-b are kept.
> More info could be found in commit message of each patch and below.
> 
> [1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
> 
> In patch 3, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
>     Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> 
> Patchset was tested with below boot images when the patchset based on next-20251030:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
> 
> Also tested i.MX8MP/8ULP-EVK.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v6:
> Added R-b from Frank for patch 4
> Following Mathieu's suggestions for patch 4
>  - Renamed IMX_RPROC_FLAGS_SM_LMM_AVAIL to IMX_RPROC_FLAGS_SM_LMM_CTRL
>  - Added comment in imx_rproc_sm_lmm_start and add comment for
>    imx_rproc_sm_lmm_check, and update comment to use "M7"
>  - Following the suggested code snippets, update imx_rproc_sm_lmm_prepare
>    and imx_rproc_sm_lmm_check
>  - With above done, separate the CPU API support into a separate patch,
>    no other changes.
> 
> Changes in v5:
> - Add R-b from Daniel for patch 4
> - Patch 4, per Mathieu's comments:
>   Move imx_rproc_ops_sm_lmm and imx_rproc_ops_sm_cpu to bottom of the file.
>   Set IMX_RPROC_FLAGS_SM_LMM_AVAIL when scmi_imx_lmm_operation(shutdown)
>   pass or m7 is started before Linux.
> - Link to v4: https://lore.kernel.org/r/20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com
> 
> Changes in V4:
> - Rebased to 6.19-rc1 to resolve conflicts.
> - Address Frank's comment patch 4 regarding "if (ret != 0)" -> "if (ret)"
> - Link to v3: https://lore.kernel.org/linux-remoteproc/20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com/#t
> 
> Changes in v3:
> - Add R-b for patch 2,3,5
> - Patch 4:
>   Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
>   Add more comments in code
>   Simplify if check in imx_rproc_sm_lmm_prepare()
>   Update commit log
>   Use dev_err for failure path
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t
> 
> Changes in v2:
> - Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
> - Patch 3: New patch, introduce prepare ops
> - Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
>            drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
>            Add a bool for dcfg->lmid and info->lmid check.
>            Provide separate plat ops for lmm and cpu setup.
>            Move LM permission check to a separate function.
> - Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
> - Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com
> 
> ---
> Peng Fan (6):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
>       remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Add support for System Manager LMM API
>       remoteproc: imx_rproc: Add support for System Manager CPU API
>       remoteproc: imx_rproc: Add support for i.MX95
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  drivers/remoteproc/Kconfig                         |   2 +
>  drivers/remoteproc/imx_rproc.c                     | 249 +++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h                     |   4 +
>  4 files changed, 243 insertions(+), 13 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20260108-imx95-rproc-2026-1-8-04f759890742
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
