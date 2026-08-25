Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA613BFE21
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641596; cv=none; b=RO8+MBBB7o4X1Qyhtkl3kq3KO1FYXp/wK25fIevjaXUntTXtv6HA8sqYD3yFIDfK4qXSbkeY/jYrp5wSprRCVFuauPy9kfnOxQ5nxcHj0b/d8OrSAxu8jK+xZGSN7IVaCidPZmmsKvf4oZ4E0nbindzaiZ7MfCCdcT6L3pXJj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641596; c=relaxed/simple;
	bh=Q/8gSOHAJgd2SRYbzG1DwwWvl7MRYBB6FR/wRRWch5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utKiwfyLzKEYUvqtWYWQT+MjMKnLznXcWEudH0z0yRIyu9+D2+E3MmjgHXJcqcHTNOunf/olVM38bQP1bcdH58EbcfJE1Q3OuVFLa7IKVSvol6Rxk3m+mpARChWStH7tXlqv0KHP+LFdBbhuHH3m0BoRFrVq1FnJQ0b+4dFM7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3ELGRVo; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3ELGRVo"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c207cb16cf5so689862866b.1
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641593; x=1788246393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=;
        b=N3ELGRVoQWVOlkaJPNCMTJ2MHzaaAPBDOPFkfGJMCnVHbKn9Zoe+s7kFeIhA08X29p
         yRqy82etE+UYsckW4scdil1dGkOkp1rKEErLrIJuv1d8Aq6+mwgTkF3/FGB3L/qJVKMb
         xbeYpcdp972OXX8gLJVH5mAOWy0EZvblM0CsoOfmgbIrHOekWvrUY8hpzYG0SWKykTUL
         j8HulSTwLEK7zmWVmt37Ri5yGdIxXjXdPkcK8n1L32CdC+KQzj5zJDeazpvsvmFnOvDt
         m14kxtjbrakAdioy3bZdoRTvZfHIaUCmdtmCH4icSl7qzwH94X/j5sEoRzvckMtX//Ls
         8gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641593; x=1788246393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xyRM/wAlBwrs4J1zBbo6tL/K6FbpaVSr4RYy/4QHY=;
        b=MJm8Y8zAewdpzNGNQ9CEOmJCf8yRjfhX308Czi96JCaODCovjBabGVeoojo61Js8NE
         uehAUAuedQKnEom6JXdFU+hO7eJ/rsFcmDPO9vKJ76Yeas39FU5ZfJo0gYM+TMHplGkR
         aAH8AAuoYH+OuSq0XxnNKD21h6t1L0n3odImC0DUqiVHM9hWhe3/GH9+JDZ3F/MdV3Eg
         1HT9Feypu+zsu6lVBl6r2AcoKT5U/uHLeWjSy/mFB1AjaoryB9oEJrx2K51456oGPn3O
         335Mhe58yO0fuT0sM54B0FoVWFpt4rLjyn2W8BmQKFxCJQ4C5fEt2miW0FMJydD3gvvz
         gZTA==
X-Forwarded-Encrypted: i=1; AHgh+RoC33dUmqt1WDJzb6UZTjRhy6CBRWMjAYl7CPBuTkMyXNrRLIVgkTjTQhI0s/i7/shpH9Q=@lists.linux.dev
X-Gm-Message-State: AFuF++kCzTSxCJ5ANt1dnSL7xtEyY+pZVkDwhArMoRSjW1izrnRM7yKC
	2oMDe3xJf6sAowk1+c0EvIad9RWIcGKBcrY1KonLJyGJQqqmLqjzdRX2
X-Gm-Gg: AR+sD12ZPt+++cHIYfhzFv3/8E01Z+H136/UCG0CmLObfaG6acCPm+LQzoBu/mRZK7t
	meR7gDjHwY1kMp45idJtELTPEKpIBQ2To1qnah0wGp0+d9teWGKAqSRshpCOb2Yw4SUOSP233Ba
	Usm8O46vi7OYEHKhvFGzH3xFDcjB/DHsDr4znvFk4CRWNR7b9Fm74Mpd4PkqklUiXLFmWUNF1I5
	IIo+luoTSkkSqiiOgC2AfrdkPOC2xK1oKrKgWHPSdPQZDd/xONmd8DY5Y4dWNekPv4l7Q4BHT4x
	jja+okRyMscuWRmpkmGLT3iZ/cjMn+wUZ09HoADj0UVZ7sLETtSZZ2MKIJsnFkZsaRlCHEGtqtV
	nZLKN2C56hD0pC/pjdCJJ7FLZMlCWtPIIX2xCXWXvNxztVpAdz+Fjx9/IZ6FmQ6NOTRpPsaO2Zl
	oCgdBOG3vnek+/U6qvd9mkwikuExRx51PvEzdBQ8dH8XAzyuWlu1u0RoJd4l/HUwHITGZbnPDfp
	hqsyuf+sH/57uaEcQBiv0EwikIjFjenNga0Sc60irnBCsE15ywJUTbWw04x+88TBXRr91F/Zsw/
	P3OvcCm4adfVUtydTf/ScQX30mfBBSNzHmA=
X-Received: by 2002:a17:906:a353:10b0:c1c:5c90:1bb0 with SMTP id a640c23a62f3a-c246a353d2emr2513381166b.8.1787641592969;
        Tue, 25 Aug 2026 00:06:32 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1565087966b.15.2026.08.25.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:06:32 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:06:31 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	Francesco Dolcini <francesco@dolcini.it>, Frank Li <frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <f5nfbi2lmc73wtxxmzs4damrjtd67p4eb4p2zy5ssqrc3wohne@cjcxqua5dps6>
References: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>

On Mon, Aug 24, 2026 at 12:02:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> According to NXP errata document IMX8_1N94W[1], the i.MX8QuadMax SoC
> suffers from a cache coherency issue (ERR050104). The upper bits, above
> bit 35, of the ARADDR and ACADDR buses within the Arm A53 subsystem
> have been incorrectly connected. This causes some TLBI and IC
> maintenance operations exchanged between the A53 and A72 core clusters
> to be corrupted.
> 
> The workaround requires:
> 
>   - Downgrading targeted TLBI operations to broadcast-all variants.
>     Instead of patching the low-level __TLBI_1 macro (which interferes
>     with the REPEAT_TLBI workaround and causes excessive over-
>     invalidation), redirect high-level TLB flush functions
>     (flush_tlb_mm, __do_flush_tlb_range, flush_tlb_kernel_range,
>     __flush_tlb_kernel_pgtable) to use VMALLE1IS via static key checks.
> 
>   - Upgrading IC IVAU to IC IALLUIS for both kernel (via ALTERNATIVE in
>     invalidate_icache_by_line) and EL0 userspace (via trap-and-upgrade
>     in user_cache_maint_handler with SCTLR_EL1.UCI=0).
> 
>   - Disabling KVM since correct TLB maintenance cannot be guaranteed
>     for guests.
> 
>   - No need to touch SMMU Broadcast TLB Maintenance (BTM) since i.MX8QM
>     does not support broadcast TLB.
> 
> SoC detection uses devicetree compatible string "fsl,imx8qm" or
> "fsl,imx8qp" since the boot CPU MIDR_EL1 (0x410fd034) and AIDR_EL1 (0)
> are not unique to this SoC.
> 
> [1] https://www.nxp.com/docs/en/errata/IMX8_1N94W.pdf

Hi Peng,

I tested this on our HW and the random crashes that occured when both
the A72 and A53 clusters were enabled no longer happen.

Tested-by: Franz Schnyder <franz.schnyder@toradex.com> # Toradex Apalis iMX8QM

Thanks

Franz
