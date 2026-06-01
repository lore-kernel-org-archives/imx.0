Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06B37CD34
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324956; cv=none; b=lYtg08UbNRRSD7ugm7jSaRYhkfmrI0v4cBKuJ8UiFJO0Wf5w8gX+TFO3xiYLR2tTC3qtWr/ijp5NHZKrJPmj9ZaIEs8EmFi2X3ZsKucI0+QkZd631eSLmXN/EwrlofBK+mslCRgHbLhdtgO44zZDhz2zsp6MbKz7de1fdOjKxrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324956; c=relaxed/simple;
	bh=KwKEkwDhKFllduxQFt6dT+HKbaAW3P77Mq493+G7AAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cheJt5nl29YD9s6doA6/JBU6tD/NMSrK9hG7cikJkHOV3MuGFF0WsC1KZr7eVPim95VYe/sLJaBXezUrqG3RUZjVd1cxMxc56928J9DxnDv/fBIsNE8ZSbaUG4rjdizvcXY4kTQkeWwPQPrW9rgUe512gcj87mtn2GFxPo/pykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCEWhLaQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCEWhLaQ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c2d792c8so9506065ad.1
        for <imx@lists.linux.dev>; Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780324953; x=1780929753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=CCEWhLaQeXiHA3eUVX7pUX+QjqRm72VNWXakuCS+w94khhGTyRO5relfBrULE7Fhur
         gA4Ta1zQEq9G287PBTNe1UNQzGhggx5Ck73JgfCcB2cBjf9EtK68gqMwdmXN8vCxVT9K
         jLjIrBk6djLoLeYujIArtIX+5N+StnhE3+3506cDbnZjWbbJ5RkHNbBrCTDet9vxErl4
         K+BsbBrKyJbROQhFbrA1XZjp97kf85bvILSAE+GXF+BHCNAWOWYE3uUkUjSUtDsEpq5V
         +MDD2c+vfe+Og0WBz4/01PNglu8wf3aCCk7OfGi8w1pKtJgjg/i5M0Zx+Q/Ikm+jr1hn
         ALUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324953; x=1780929753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=kfsizp+3Y4ERp0HVGlurAM1je6tIHsuVo+ceZdMTq+wLXa9sFSCIxZWIJVlAIGc6kh
         fVad8rMO06HToKLnTBuGuWzZPzL6gtIJeK3AYmjMUAzaGCcljlD9ATzBNwKPVD0H3ugm
         22mXzojGoF1ymLslkv8jqExyc0D4ZXXgFVewK2afKzEvhHYqPYfcFTuqGHOgTTtiWCG9
         1KJiJP0tEwYNsszPuF6GuCEB7IM/B2OYHSn2xTLColvyn7HOR8cz/ijt0UZtRGhIndvr
         6fIBVwXpx2NSqMHiQI+tR/2e4GIbqqReIiinezM92X8PcG/JOPI6BgHFU/hK6LjpjLiI
         TZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CyyU3mS1+7gBzhFED5PcZj+F17F2Rk29Vbcx6PmAaA12zMGKE6/yJkAGYzmVqsE198ew=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMILpLBNANCGz31mfTty6WFK6pVonZdb69u+HOZHQq0882wl4c
	t+asG4p8LfJ2Uha9O5FpcIn0O5CPPFwlpMZcAiEf5IPhiAwTXN6DtEmd9F+ZtGSn3CM=
X-Gm-Gg: Acq92OHUpzGAX/hjVQVrE5dIWho3NS1KQ9eORtoZbURuBZb/PG635SyjN7oR6rOHi+W
	C4FdudqGoMaHij81RW9/wgEocnL8aspAYs+td7ShCXfc1CbIzMwFBk8VC2KOsljhnB8uLTqs7nN
	f31wESTGJubzy41eb7jecKQC++QVHB6+tRQeVeYKwqNa5BqizGEBLIkZBWUH90pKWP1goBQV+PL
	BvgnF7XuR6iDqNu8Jj/TXYjcA3YyfHzPUK0DA5jjtryDm89PphR9runjo5sGVFgNtdj8Dnoz3dO
	tfQmKLafRXUaDdq0kJJqCHHUDpgY51DXQBBd3XaHgwFpOrG1pG0hL9PXv0a91Qj1VQs798FDj+N
	TGH1S7YiLg6dOlRfLgPA0e0BYAn1jTY8c1cBvlsJKOwOZgVKmYK55bJ08htoPgfs/zT8RMGTGty
	pYYbSLWxFFldJLvOiP+oxOyCNIeHp5c3D6zZ4PssRMr5/Qgk9N
X-Received: by 2002:a17:902:e74b:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2bf3679ebc4mr132076775ad.2.1780324953150;
        Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:86cc:b476:3696:fced])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0842esm107038115ad.57.2026.06.01.07.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:42:32 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:42:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <ah2aVdlsLqy9aeHP@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>

Good morning,

On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
> This series is a preparatory remoteproc cleanup split out from review of
> the AMD BRAM-based remoteproc series.
> 
> During review, there was a request to move the duplicated plain
> ioremap_wc()/iounmap() carveout callbacks into common code and to
> factor the "missing resource table is OK" ELF parsing path into a
> common helper as well. There was also a request to send that cleanup as
> its own patchset first, with the AMD BRAM series respun afterwards on
> top once this cleanup is merged.
> 
> This version keeps the same overall cleanup goals as v2, but reworks
> the optional resource-table pieces based on follow-up review:
> 
>   - reshape the optional resource-table helper in patch 4 into the thin
>     parse_fw() wrapper form suggested on the thread
>   - switch the patch 5 clients over to that helper shape directly,
>     without post-helper rproc->table_ptr checks
>   - keep the driver-local parse_fw() wrappers and their existing log
>     messages and severity choices
>   - retain as much of the existing per-driver parse_fw() logic and code
>     placement as possible while moving the missing-table handling
>     through the shared helper
> 
> This series now does that in five patches:
> 
>   1. add common subsystem-private callbacks for the exact-match
>      wc-ioremap carveout case
>   2. switch the in-tree exact-match users over to those callbacks
>   3. mark carveouts mapped through the shared wc-ioremap helper as
>      iomem so the framework uses the proper I/O accessors
>   4. add a common helper for drivers that treat a missing ELF resource
>      table as optional while keeping per-driver logging decisions local
>   5. switch the matching in-tree drivers over to that helper while
>      keeping thin local parse_fw() wrappers
> 
> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.
> 
> Changes in v3:
>   - rework patch 4 so the optional resource-table helper matches the
>     thin-wrapper form suggested in review
>   - note that patch 4 still triggers a checkpatch --strict warning for
>     the flow-control macro form, but that implementation follows the
>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>   - update patch 5 to use that helper shape directly in the client
>     parse_fw() callbacks
>   - drop the post-helper rproc->table_ptr checks from the converted
>     drivers
>   - keep the converted parse_fw() wrappers otherwise close to their
>     existing structure and placement
>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>     both with and without an ELF resource table
> 
> Changes in v2:
>   - split the mem->is_iomem change out into a separate patch
>   - add a common error message on ioremap_wc() failure
>   - drop logging from the optional resource-table helper
>   - keep driver-local parse_fw() wrappers to preserve per-platform
>     missing-resource-table logging policy
> 
> Ben Levinsky (5):
>   remoteproc: add common wc-ioremap carveout callbacks
>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>   remoteproc: mark wc-ioremap carveouts as iomem
>   remoteproc: add helper for optional ELF resource tables
>   remoteproc: switch drivers to optional resource-table helper
> 
>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------

This set looks good to me.  I am fine with the checkpatch warning on the macro -
given the redundancy it avoids, I think it can be tolerated.

Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
and Peng, please do the same for your platforms.

Thanks,
Mathieu

>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1
