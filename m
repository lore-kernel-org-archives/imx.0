Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300352;
	b=Ro4Ymz7TRZJo8GI7Br1W4SUstfjtw/Ab13W2hP3HX/Z/aWz/gJmyMHGwRCkzDJ20wsOF
	 Pi+vqDyWImcAqGSRQPu3H+XmqQJr4b/n7hmeThIIlv19WahIIy4orUBAQRd57K521wU4l
	 btvk0M4mIUK+8B0q783zRwohXYAiFDCLvZQwcoeTi4/h5MRMfZ+JfiYMan9hoP1iUsyPj
	 Cz/hPSY9maUtKI1UrI5s17LGtH2uGstSHiVQu484M7Ad0ILKfAYDGfsFF9EsYjPRIDnrZ
	 ZATCaK4ETdT3uFEZq0j7fVYTosfWSRIktplqqxi6hdss5rnJIG2r5gWTXb6L/rGFQ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
	b=ZA7VKl0Zr62CqIvtG6kv7g1wXEF79XP4PI9k7MPaJSTYdIc4L2jkwJbMDl2wvAmafoeq
	 YPDS5FNHf5QE4N0sT3Js74syYr8JmkDRYRqPL9/0hdZTFjhlAtRr2rv73mz4uzxMnpXcR
	 qnXhp5X/HhH59XuO+TF9W2K6vkyJEEJ4bsq1M6eb46hop6qIGlR8n9ltaHhpbO9iTRjyi
	 95+WVgKhC7CcxrY5CkCZlh4ki/vmxY3i8jRupLIdhBb9XSe1sd7z405eqNCYSm0F1ziLe
	 9ND3Rr3nzeMA7pllC/WiA9tzMpGRh+ycLOl+2kpjTi4crSHr9HpEug+zOLO454c2rcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9Vivb5T;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02024606A331
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02024606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9Vivb5T
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so16225015e9.3
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=n9Vivb5TqpsSyppk6cFWW+1D31ir1UyzZpBK7DVSRRChQLLaDj31UlBbNKx4YmWXag
         zVhyfGXJPH+MzNLrU+mvz+ENl3bIjy/90SAvNWgNhkrBVwEvyG8vIAIx3UPabgO0ZtCF
         ZRyH3umxTrS+VkQXUxVvWPZIPfKSWRFwu1dTt13Rj0cby9fCf5XCNBBPLcWGetGiWhc3
         6F+xzB2w2OZ2k5ca07PTeNGvImsviLMMbUzVnHjVp0ryII+FiHdg9e7xBxuZe8lEriln
         sooL3S6eGLjAekJY4vYbjolm+Pvn7suKQndQusP8EWjwsAZ1xE74xGLP7+JZOW+nc2Xn
         WlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=BOQt4NUinA8/Nv2xnV2XJ6OHdmPnvl4UGdjcFNwPLgPs+EgrpinkY/lxv1fRhSrLlH
         QSyt+YEDICz79z+eWHwlsMrdWreXiaVQytod733LYWSuRGh5VQMSCdfbLmaM2/hG49nD
         luAp/vEDW8FdFB8D/Uy4+qIi861Qw5vZwXS6POaBAISNgyGsGPjn8ApGU8C8W38uSQrW
         WmZylTLssEUWXWcWtcZ52HMBT69yAb9hA7X3UCNclg5MBP6TNMLvLTuBT/9jN8js7L0d
         pL6kaWpQBVHbQ/cEgVno1ta7uyZGX+Tw6clkA10J2XOhErAa+jYxdKv20B5U7xWDVp9l
         9yTg==
X-Forwarded-Encrypted: i=1; AKwUvBwLUsTZmOW0hSux/CLW+pJwjBzfJW6v1cBgYTc6Jw0zatrkgXp+fa4VQUJ6UReLWJ1DXbM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLmAC4wlbE59xminhqH90DCCUdLpFyMbTtA4yjFQHbmwrkcJcuZ
	ZHRT8RLpj99kzNH6CfS+nN234dcbZok0KwY+faqS9hW0f/0ywbqQGCNt
X-Gm-Gg: AYBFou27Jzhw1HuYJSTCXM9Yh6RAssLqpjogGTTbeuTCnZeM3k5ieQcei1nEOSDS2VF
	h+SVRIZqNkMw9ObaWbpDarwFurN04x/snuB0yNQhxf9Z08AFPScbq0qdk4A9cYI9MBXAvoFupDS
	UXqkFUUg3dV/UuomG4qwdh/MvIpp6OeniDwhhbEe6MHXsychAuRbyiCR3OoE2VoC46QXPjrlYmI
	sPDZNxAqaNqiE3Jct30HvoZzIAAgJoaBa5tZxZx9arWwX7AYcTdvF5ABzR/HwGKZWnIX/hmexgr
	rCZ/atIC662AMB0TUMxZaNpswd1IYdRRz2Av6eFuSorUtO0jyfpnEvVzoHs2QMPlDEI1Jt9sJWQ
	8L6joUo/xTvYC14MVM8ToXX561Ip3DVXm8et4dFoyaFSc7fwBXCMvumEARusf3q35WzcpkaR2qO
	VaGj6cPQDndCMscru9bwQqvW1YFZYALqlVwEZDfyrSgYMbcMYm+TWqDnOwsK/BqnFWLf8dntudd
	DDr5b1buKyq+RN3eF9kTa/112yvW8ALFNLGRhkGCEf62wyqVWnVOiebXNexE15zTBIZk4BKjKtT
	9tUaLMcMG5JQrXcsfOX8PBQbGron9o09W6hcl1CwpUTiNmCHKrqiy/r7TujWMujvOXu0vZ/aPpx
	nOLfPJ90rzaolCZ6QWbV8uNKm9mgtUdFYIo1H3bb0XMf8ZAIcjN8Gz6V2P6ttSK99kYCZsB4gwp
	MhwZ0xLJf083W+
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


