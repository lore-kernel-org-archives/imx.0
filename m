Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4179423A9A
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747367; cv=none; b=mlAd1593LdUB/a6Dg+uWV1nRE+IQsptDlilS4yWd3fVrWFyGUYUC1y9pxKnD8WbEC4BOrqTIHyKUkiMA63ynA7tK/wVbNBUG/AofSSeCJQJI1Ddb/ck/gpwR444TnJvdH0nPG+GhXIkXyL1zhDlm0T0rknDDHkb7FLkpMu527JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747367; c=relaxed/simple;
	bh=dPo8To4lMTniabQIFcwXhKUudpCTlGapUPHUrc4t7vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U63NW1BLNQ0zjDvvYUwyy8a8PpoDCPvgEaEOKwvAViqSgxE3XpiqbfT6eJa+FqwPIgBSKtSO2GQmjzhkGauLw+lVBmZYTvSP/xUzXyPQNxQQbSep6b0Cd1GJhvfauSNmGGJka2QUcC2H64lSToUmTl+uHMYYIiPVkcpBYjK/+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNNM+Oen; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNNM+Oen"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c82da9504cso9950715ad.2
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782747365; x=1783352165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=BNNM+OentI60EWYk+vU91PgWQBpOVhXv6X2Vj5X3fBlIt9OaBSULqxIVkzjqM/fqkl
         Bvo/r6VM1uOv7oWAL/UM+kOU1HaAhQL8R5JXd0M7XZlUMfW//3BOLQugBStCfS03BYPX
         /RVr2Fd7anc2x3VOdlRw7lsAHKxyy4+VVzhgrm+u/3EaCZj/tE7Stb2NyatD3CQkQ1lu
         KCK/sAfpb4ZDVeUCi29V6vpLiY/fB1h+D9hjIB2pzDs1JlmaOkpa7Iq/prC7veThuC+i
         gu2EpcKKuaWu+D8Ks+wbu89HC9U8Z58RSDRczznVZgwP5NqH7T2n03aoaCcyTjr1Nynn
         PJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747365; x=1783352165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=eY3DC4cJpSeCJ5NctSq63/QmvHkaJN3zOKM8Dn8KYeMrTScZpc4V4RJWRGtBpE54j2
         +HIk/ye7s3HSERui7OESi2XE16D3NN1id51U54A3qV074TOUE7DOBU0Na1lgDFrpiH76
         rVs6jMebZfW4dWQwjj58vbtUCcYqSJlPKpwyTe/8Gl5Z7IunMnvmr1bmCzUD9G3Vvq1f
         0oLXnYmVQR6YPXByVFJ2BpNRAGQrzNy/blIYoPlMM3Mtcu9tzRqIznBwhbS5Zl8HjJy4
         RFi9ZmqjWOUdYLnOd0C77bBAg2lnE4OkS65vFG6EqeCN4Unymz/tKmLlhPBRFpaPMp7P
         kiRA==
X-Forwarded-Encrypted: i=1; AHgh+RraVrNuCOTOuHGLWPit8W1aNlf3z2JaeIwahPQawcJgMr2IGuRq3unb2AClWz0RKZ0TYoA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1p5LJ8WYSNUByu68+BkWRVRGL+OjM9fNol/JJKvURF0fYZgtZ
	XNqU5vW2FagU8qHF81LGDWjUDYR1ucWqQRi+6f0TBMdv9k2m70DA+NJ3ATH1hYSF4mk=
X-Gm-Gg: AfdE7ckK8Ajnk4yFgB94pPZSYB00ilslPelkgxZGijg18HMIftoaU4pdkf6prbnTELf
	88CnBSNo9Goe1rIEs0rljq+wQgw6LlKwGvn9zCK+0Zjxgc2QkvfOC6QdqKFOAnHZSE6+4mg6cw7
	KgzyWyGHb6bTaLFMnofFd8KWJK4VUyTQqp3m0Xh46s82psO1uHq0DikjrbRlPunQIYa8aRXlady
	IPzYUiH/w2uTTxa4scsq9OjD00IoUHI9t7zk9HOIW62bxYUDwq1bbPv9N8UZIJ5gNwXiHi6TVT7
	Zq+1gxONQpfWYwfKC5gDcoIvQAwKQQhbwCAaKynRocW/q3q3Y0KB2UwwcgvTJXNkvV3QdXNqXEH
	RmJZlZCGsWqclkSfWXXcvBe2UzHiE7K19qcqUCyeEFe9UppxwdRQHPaubeY55J/yuVl1t0wOXbM
	iNJKdbFWRetPd69UlNihpx18++QzY=
X-Received: by 2002:a17:903:2f8a:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c9854b5597mr89458355ad.12.1782747364963;
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm98408955ad.56.2026.06.29.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:36:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
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
Message-ID: <akKQ4H09G2MpRVGN@p14s>
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

Applied.

Thanks,
Mathieu

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
>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1
