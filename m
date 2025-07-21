Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6C2D5C61
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753105205; cv=none; b=dT8rsrhBm62901tnyg4rL/5dz3DCHhgJPwCllWoGbf7Kl/LiQh6h0DuTC3NUIhTGJ3F9SUoCNJV/MyLe6JQgBPj+Uq0BbyGa1aw9hPUb40eOr5xlp7ZPwIcDpUHiVS5qZ3NOjMqhMdVmRSDAM5uwM2Zr95MIE128E0jIFhLr0ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753105205; c=relaxed/simple;
	bh=aqBdv0rBs3uhb4aYP7555kNHRCmkMNDCz8T38ZqdZU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGuLEcYAZ+L/oOyOZoYM7qqnhUf3yMJkY8gQrpJNIp5m61dquHLbx5R3wz3QKZZ1TyEWTGI15JlSMORSZohXoc5DylSVGRggyQiHazjHlhqr35PtN+IOY1XgbA5qv7DeAcv165814mPogRTF29gs+KfLfGnSorrRdRP+P9bZS58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFTe2E+R; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFTe2E+R"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3ead39d72so76515266b.2
        for <imx@lists.linux.dev>; Mon, 21 Jul 2025 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753105202; x=1753710002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDniUm8HNahJCjx1uXd/VHwom2lOWNGXKKTWQ9DCUp0=;
        b=eFTe2E+RpeKpk282M4QkkqXLdyWJ15TDAMRQEWdUKL7o5fQ9MWVLxyP7a/72tcMzW+
         CMd3YbozphAr5XooCCYOOxsCTzcza8f278yw3xqEmMN/92e/2EvN0IA12Vk6soH5wiso
         oMbwu+XLKwHr8CFUjOxd9G0nfSjOkNH4qmSbwYSsVWPGFSaHkEbZtwP6VaZyPZ6Uf3+3
         Dw9bbeRPyxYMAN+/anuf5ZG2mca4pkVJi0eZKYE3zw6T1mhZXIv6s0DVPSpfRgRwWJfH
         R1maXeO1CbQ5GRRRD+DqS8RHJXxhxjGbnc+wz5e1XCNn2L7EUsvwV/z4qgC8fBgpxKhN
         b5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105202; x=1753710002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDniUm8HNahJCjx1uXd/VHwom2lOWNGXKKTWQ9DCUp0=;
        b=DtQ1USTJ0DjB/B8QymZTPIZgiKyl5uFLUSytsax/nBkq03KB8xJyjjQ1Y6tyCVFDq9
         bNeM7uVwbo4YdnZqOF3eluDGV8FOyBVUKxZ7sGLtio7VfwIcfkVH4FdcbF+ODwiVNDzH
         rmKxdwi0dfNNvXepFMBZSKCoCMSXnCrFXZU+KQ6dDcZ2KNy1kj2k6EaEnk4qN1iFi9IW
         SOnH4gLNIY11M54gHJwxUqFt+YDlo7uGnBr6uDFwUcoH7CwecsnmABnemHotK46956MN
         5vUU/ayPIDSBvEYtTn+9XvTBBb7jyDAy12FAAEvConDqlKXdSq8B+0yBed6yO6/185iV
         VFSA==
X-Forwarded-Encrypted: i=1; AJvYcCUVlHPi1jKLplXMpM38BzmS790+QUSwboxUV3sAPSUYubgAwKytiyAcOBkT0wpUp6vExuo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyTNszReUygweq6VjCIbtjMNMR4h1gaLZ3Y8YAvOPONDpWwA6n
	Z7rCXkCjg1urvVEPXGvPVRYerDgiPWpWrMOolV1/MzgQOuL+yb7dYKZd
X-Gm-Gg: ASbGncuYDn4d/wREY9ZwNAPhogOhKDvrOaEH4vTjmz0dNZm3LCZ5CS5cEccKt905pmZ
	PV0rYvBFLhThW76JyFRYaVamkFWbHHuAgirvod/RplC11Q5r0ofLxZv+94wUQzJdh9VPCUaG4EB
	1xrOo6+N6RoWZgRBDb6+rObJ2drHPzcwi2eHTRO4hCovyZwBL2N8QkBAyukRO/Y1wCKr0380Tpr
	zrQZldRPqKU1aTuQy1vn8Ffs103ofKilpQxVe3AokO0bwato7N4XdnPGMd9pY8Me7Tptf1+RugZ
	Kn2QWh10z148Xt/3zeWGhpC/MFKIVSKrHxZoQ9TVSEtCqzK9QQ9pPpvCCqVH3zHW3Z11hgGhaku
	/QgQR3W9nq6aD/AI=
X-Google-Smtp-Source: AGHT+IFsNh6bo2feFuFv54zmHMiND4KzOlDox4TOr3Hq8r6s5el6taFrP1THbgj0l+Pq22KHcj3ewA==
X-Received: by 2002:a17:907:3c91:b0:ae0:cd6e:5d0 with SMTP id a640c23a62f3a-ae9c9b210e8mr761689166b.11.1753105201594;
        Mon, 21 Jul 2025 06:40:01 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d00b:9d00:b8ad:2ca0:b375:ea32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79f139sm679347366b.29.2025.07.21.06.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:40:01 -0700 (PDT)
Date: Mon, 21 Jul 2025 16:39:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
Message-ID: <20250721133958.dhityxa7vvtqov3d@skbuf>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-2-178dba20c120@linaro.org>
 <20250627213041.vp6yfcgf4xysdklf@skbuf>
 <eb704af4-5800-49b6-9915-c990c5b23fa1@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb704af4-5800-49b6-9915-c990c5b23fa1@linaro.org>

On Mon, Jul 21, 2025 at 02:25:55PM +0100, James Clark wrote:
> Hi Vladimir,
> 
> Just wanted to check if you are ok for me to send a new version with your
> fixes included now?

Yes, sorry for not being clear, the tests which I wanted to run were
these ones:
https://lore.kernel.org/linux-spi/20250630152612.npdobwbcezl5nlym@skbuf/

> I assume from the other discussion that we don't want to always enable DMA
> mode either, and we'll just leave it for s32g target mode only?

Yeah, for sure don't enable DMA mode unconditionally. I don't have time
right now to look into Mark's can_dma() suggestion - if you don't have
either, I suppose it is what it is, and the performance improvements
brought by your enhanced DMA patches can be brought over to other SoCs
at some unspecified time in the future.
