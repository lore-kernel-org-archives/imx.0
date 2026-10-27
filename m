Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116525;
	b=5eWXGf2z7nnLIHFmfvNMCYHmQX5Z5PqA5tZ8dXLFL/cOa720I4vmzWV27tCuk3xmIDiE
	 FJC/W4Xek0672QbGXa/wjm3RkDW2HK4m0BpHSG1hMxNx9m/KPeMniLicKTqIK8eQ5rcWW
	 Ib9u42HvbhJuENZwpNAnv7gn8N3W41m9dumvEcvBYTUf63Azyec4/gaed+T+VldL/0B1M
	 3FVfmjiqSJSZOn9flTeaXcwuKQ+AraJNCO5G6P+OxrOF7jIJv7BGfB0Z7Y0TFB2xXj/jJ
	 8wDRSC+ajxoYnJdZKcP5iHzv3XafmsoQcRzEmMO0ckVDg0HP4vTevKuFmTaA9xiouIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
	b=iW9tJSaQzX9gcF9YumADX2g/7LZr+rbV7a40p2ZAzLB3pHfSvVjxPHT522Fppm7qfeGS
	 kifSuGyddLkbSxr6/WK9uJLUuYsVixRaY9EeTlYiYPw7mV0CQIPoS7K0fDKuvukSLY6oT
	 Ysn4wY+9+xWPK+LNtLdACAytOHTcUuTa3ijjGWCVigSTKH+6X4RCafpS8N/R8jJi4bpvd
	 SnalEsRVb4E2Bec33jMhmMqFOrPmsfr157q8YAj2jzXE71XuJz8AmqZND7j/LaTqAGEp8
	 aHHLGKi22HiGjuKg9tMZFxlvuXtxIBewyRBEIizczHXYbyB+Yct8AdGxfAIUAjqyFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RuDDpipM;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F53606A31A
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F53606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RuDDpipM
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8b20a899fso28273965ad.1
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116523; x=1793721323; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=RuDDpipMYib00ULmAMDey5HrL34PuEK4gbdIDDp/QzV3agyCAvn91OkndpjMAjp6Jj
         pkiMT0KI6z3W+2nRzUGqkI1tRf55d75N8F69B+8xpcdaZCSNThIcWb0lk9CtW3sxm/t2
         ZXLHAE+cx5II01VBE8xtKvd1uWUU6AgjDcqqY/OoEx3sBCr71wftx992wdMtilN5i2c5
         yVSAZcRUNYo29l4R/h1YsDP6/A0zN+hZqsBdLBXbpDrUG1ixpCUV7QpP0xAUftCpc2gh
         ur3NXsk5zRoajT3ra8rhpa1/1+Yhet7677uZC1DvsZ42YwZGcwTPRlaJA5WLcSdy7rXx
         GhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116523; x=1793721323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=JJhvG4BoA6CSqxaw/d6ezD8M9L6SKdTOUArR3sZ1PjBtLTLI/PLYXxmzC7I9ZVkwrE
         UNVNxbt1VbIFLc5M5a5shER9qIt7TkLFtZTAENdJ5UvsoaSC5DmO+FVo4iu2+7s777np
         MjhHd8HN7wpP/vYpvjc5g5vNDqUD35XyL8c+I6gC4tDwG5+vE0qxV7cghMXEMXINMe6k
         tlASV7iPH2DMOrpKC5Mzq59q/XKUZWEHG9NHwqokROTMn1a4/1tZS3CfDmWGxwOYvgBh
         f+hzBwzl0t0x4jw2UD5GHLd+KGILPWH5f7PaGvtv1W521R9Y2DmK6bk/ylrFLFRMnZeG
         4u3A==
X-Forwarded-Encrypted: i=1; AKwUvBxq2kxh861izhecaOni6NEs52t5ykaO4NWnSYd2yi/wMpNNHRBilSAFOsiShf7H+qUFr2w=@lists.linux.dev
X-Gm-Message-State: AFq9FYKptcMMQZipqUHY39RiDLt0DBxk3WgWlVAJDkXrrpO6dhjatIqU
	BL/e2odv/3Zrwo+GLflYGPb0gFpQW5EfX3T0y/TB4TBGji9tnXoHjqoWC7lvIJ6uvhk=
X-Gm-Gg: AYBFou0Z7idWuIlrUQK+a39r7fd25JLizTszNv4eOmX67O8DoLVa8jtuOkSDg4DjcfX
	o0A+XzKpqf607PwV5W0BE61GcL9b0MHauV+hEMRqK7fYDRpScsbOU62a2BwJQdEOiMYhy//o/rg
	rpDkSh14gJ3p03NJiFRFOlJnwbS74h91xksKZgRVll6nnfL9x3H57FnJODPcFx0djcXF57OJlwt
	jhLFVZTvf3AHS6/KttCNFwhHLiMMecoef3uoVRebDw3lX6SKcIUNsgRv3h5WytMT2tmDwKqokR6
	tDxp3sP1c336tz+rk/IXq3fT8HK129vaOpvrsmAE3mUWYrnSWS+dFL38oUlnogYRkl0OaKUXTcd
	8aKEriY6HO3kcOtsyaXhbv0YSLd2nx/7/nIR/QZI3yVTnJpYpzlsVNkbi+5sOeZvyyBOMYB9I/V
	mbJqesWdW0GelbQYfBrLFraoxnD0/LX5k5os/x16z/O/8m8/jhzBaA2fa7q9u6FmFGGQUv6qaiF
	j0ihXBKws53wU9rCBYDop4eBTxCZTsq9UhcP4iMF+KWLdVLU1pgs9r6TuA=
X-Received: by 2002:a17:902:ce0d:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea9c7f6e25mr84880745ad.23.1793116523155;
        Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaeeda3f66sm9720725ad.8.2026.10.27.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:55:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:55:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <auDJaIHqoBSOxGHK@p14s>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>

On Mon, Oct 26, 2026 at 11:09:29AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
> SC846 and others). On at least SC846 the memory of the remote processor
> isn't directly accessible by the main cpu. (The memory is mapped into
> the cpu's memory space, but cannot be accessed directly from non-secure
> EL2.)
> 
> Instead of creating another near-copy of rproc_elf_load_segments() that
> just differs by the memory access functions, generalize this function
> and make the driver that already has such a copy benefit from it.
> 
> This is only compile tested.
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
>  include/linux/remoteproc.h                 |   3 +
>  3 files changed, 69 insertions(+), 117 deletions(-)
>

$ ./scripts/checkpatch.pl *.patch
----------------------------------------------------------------------------
_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch
----------------------------------------------------------------------------
WARNING: 'addres' may be misspelled - perhaps 'address'?
#56: FILE: drivers/remoteproc/remoteproc_elf_loader.c:233:
+                               dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
                                                                                  ^^^^^^

WARNING: line length of 101 exceeds 100 columns
#106: FILE: drivers/remoteproc/remoteproc_elf_loader.c:264:
+                                       memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);

WARNING: line length of 102 exceeds 100 columns
#129: FILE: include/linux/remoteproc.h:103:
+       int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);

total: 0 errors, 3 warnings, 86 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch has style problems, please review.
-----------------------------------------------------------------
_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch
-----------------------------------------------------------------
total: 0 errors, 0 warnings, 151 lines checked

_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch has no obvious style problems and is ready for submission.

> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> -- 
> 2.47.3
> 
