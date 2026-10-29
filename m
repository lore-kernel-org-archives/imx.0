Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297494;
	b=B7aD2UDyLjgDkVIhNDhrFCd09iiarOITp3b0xEisLXXXXtklFgQnmS8NvS/7Aifr/Qii
	 WvROZfEmNkltariet/823qtfBL+kPv6q9HEBWQsdQKOsjJ7hFcm0WvCn1oKiANQOtxbwG
	 NtvGmIXK/zKouEGg6usj9A5djRpxsKZwbGgNqfTU1ecOJ/JWwi7U1x1pG5PJyi5h9AG/+
	 XIv9CvZhF2VJeYu0HFA9blSJ5YzkE+KKe2fCK4VZnhDgDnl2BG7rZ2KZbi4/fe2podvsr
	 j8vkQ8+2xr0GHSnxs/8SY3TthT/B++8+KJqlEBfufTHIYyBBFHLMjt+KBoTrOnuVOKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
	b=frklGolrCUeLCXD71l5xCMeVgk/42RUGN+A/YCrHIKARUPgbQQS6dTQcFp5tWoGZGxqE
	 uiJZZZvwExeBYNE9OVhJCDweMHXgQ5nxtndpg3mFQOmtjPA9/rj9e60yHf8lEGs3bZ/Ud
	 yvwrQ825O4D6RM5nc12FEmGZgZ1c22nUPl2ZpUUJtoKsDltHRLD/UPGVaxta3JZ7uKPEK
	 pKAuRFML3zAeyzAhbS96n4LlLnVVgih8umhKNC/IXMogtYGY3I9YaGAL/RTT3Kmn2jQms
	 8x44HMhFvSpL2NHSHwfYb+Jrafar6TPXqA6UZ6PpFvSy6vP8uAdhUYQFKh7janeCsCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=atvUF4gw;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C69606A33F
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 18:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C69606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=atvUF4gw
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df7f544919so1539428eaf.1
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793297492; x=1793902292; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
        b=atvUF4gwmcPMsiIaDWedbAbCBy197wB5qj5u4BZVwwHdEcjTLLuLLueTt+TH6oG6Y7
         IujC5Dt8yIns+NGVC9BI9PloCDt7aWp5tD+FeLauH4t5tkGLnIYJ6AVptLD3P/7yltRR
         3dVMAml8q+ktHmxEaMi8gmp05ja9rA4EyGa+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297492; x=1793902292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
        b=oebNHCfHBTMwKWmBJz+Nsp4jpfW04HoTM81QKSmE8eRIDkYAtWBH2S2kW4D+mVxShu
         ehV+o2Z0tG5T+/0TYkyNRneifKHz7js6mTtjqacjieIDPEH4j9oNfpzvXCW932Fxc4Cz
         PllQRnURrCN2+4LZY43fxuPgX4D3eO4D0owL4Cxi1YntpsEm7nJmzSt30Il3rPZFtQV0
         Hm38Q4M9Bh66q0SRuDqhpkgLlLtxluesuFm9mJUkoBHkTppz3Fj2cQwvV1WpUBNKcbIx
         1NE712n46qMZd9lKZk1+lmBB0PGK8STlogV8x5R3z+M1mQFcKClgGti7fy3nNEareZdb
         ilIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLzewqSB5AAx4p3/HaGs+auwGxcBZWq1ti53z8RgL9qQwccHbMwYH3wN/wvyqVM3zIJjE=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9vbERbidBvp4PH2K4jof9Qhw+xhrpuWRayZN6irqM3mZRJ41n
	AAQ6vQC/HsiprS3cZvErRtE9/e6IbcDhr/kRoziRighTSmkJKdM+j+m2c7K4yHtN+A==
X-Gm-Gg: AYBFou3YhZHOZ+dlEQL8coIuqODqw5DeljEFCTeIiQZL7RP83R6VvN1VL9XsSVN5c6J
	OIcqHvm38XVwuVavan6a5z5rDo+dzd+/C8MpGyx7/2NurJPO5vsFT8UL/gCZDL/Ctl0aiKNCkfT
	9TORjH4EBusqG4b77qVMPG55TzPLPE+qiDIbg0EPDwD5loi41kV5QT6jeRGYzXyncETES85peUG
	Ifz7mNCjA6h3PEJw/E34yVgKIp31JPXG1en0goctMCvQlavdllaeVA92gCbT++Wb7r6CwsRLOGE
	UWPAAMB6N9RoGT/RvsugVYb9ce2J9VFiS6nr0MambiAlljPEM3lC/ODeykS4R2eyd0GQiZY2jHV
	sM63nqjRuqVXWL58PSQJOeYbEG9Ux8PoCrWsVnLnJ+XGlETgIC75QNhs8wzKzXfEojK9Rxy4Jgt
	JepcJgzagubbc4DDRQUgR8OkcfAQCiPYzwZG0UPtwemoiZf+cP38lv5qAAKhmmmV1CuMSWE9In6
	prZ+dm+u7WzCP7kYnM6ApGr2PDnSlKyP3/lIRIXmv6JgqfDxMr1rbxIqqV4WsrKYUhnDYcsl7iI
	rSgsg/kvcpo1Yfto7NSEm0Wm2D6nN+KPmn3yrdIO42hmow==
X-Received: by 2002:a05:6820:5710:10b0:6de:aeea:5c89 with SMTP id 006d021491bc7-714f288a10fmr36729eaf.23.1793297492247;
        Thu, 29 Oct 2026 11:11:32 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4a904856f09sm130363fac.3.2026.10.29.11.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:11:31 -0700 (PDT)
Message-ID: <4c7a6635-7382-4e57-ae16-6bc2ee694f46@ieee.org>
Date: Thu, 29 Oct 2026 13:11:29 -0500
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
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 11:30 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> When CONFIG_PM is not enabled, all devices runtime PM state should be
> treated as active.

Should be treated as if runtime PM were enabled for the device,
and the runtime status is active.

It's a subtle distinction but the previous behavior returned
EINVAL, which means "runtime PM is disabled for the device".

Anyway, for the IPA use of this function, this looks correct.

Acked-by: Alex Elder <elder@riscstar.com>

> 
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Analysis of all callers and their behavior with old (-EINVAL) vs new (1):
> 
> Pattern A: if (!pm_runtime_get_if_active(dev)) -- no impact
>    Both -EINVAL and 1 are non-zero, so !ret is false in both cases.
>    Callers: drivers/accel/ethosu/ethosu_perfmon.c,
>             drivers/gpu/drm/msm/adreno/a6xx_gmu.c,
>             drivers/gpu/drm/msm/msm_perfcntr.c,
>             drivers/gpu/drm/v3d/v3d_mmu.c,
>             drivers/gpu/drm/v3d/v3d_perfmon.c (x4),
>             drivers/media/i2c/gc08a3.c gc05a2.c og0ve1b.c ov6211.c,
>             drivers/media/i2c/ccs/ccs-core.c s5kjn1.c lm3560.c (x2),
>             drivers/media/i2c/s5k3m5.c thp7312.c imx283.c ov64a40.c,
>             drivers/media/pci/intel/ipu6/ipu6-buttress.c,
>             sound/hda/core/device.c
> 
> Pattern B: if (!ret) after get -- no impact
>    Both -EINVAL and 1 are non-zero, !ret is false in both cases.
>    drivers/gpu/drm/amd/pm/amdgpu_pm.c (comment says "allow access"
>      in kernels without CONFIG_PM), drivers/pci/pci.c
> 
> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>    drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>      -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>    drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>      spuriously triggered WARN. Fixed: 1 > 0, no warn.
>    drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>      -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>    drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>      Fixed: proceeds correctly without CONFIG_PM.
>    drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>      (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>      xe_pxp.c) now correctly treat !CONFIG_PM as active.
>    drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>      executes stall register update.
>    drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>      return now skipped, correctly proceeds.
> 
> Pattern D: explicit -EINVAL check
>    drivers/hwmon/prom21-xhci.c: checks (> 0) then (== -EINVAL).
>      Old: took -EINVAL fallback. New: takes (> 0) fast path.
>      Both succeed when CONFIG_PM is disabled; functionally equivalent.
>    drivers/hwmon/eic7700-pvt.c: call is guarded by IS_ENABLED(CONFIG_PM),
>      stub is never reached. No impact.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Cc: Karol Wachowski <karol.wachowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: "Joerg Roedel" <joro@8bytes.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Guan-Yu Lin <guanyulin@google.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: Rob Herring (Arm) <robh@kernel.org>
> ---
>   include/linux/pm_runtime.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 64921b10ac74f..de9e7518ecef2 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -280,7 +280,7 @@ static inline int pm_runtime_get_if_in_use(struct device *dev)
>   }
>   static inline int pm_runtime_get_if_active(struct device *dev)
>   {
> -	return -EINVAL;
> +	return 1;
>   }
>   static inline int __pm_runtime_set_status(struct device *dev,
>   					    unsigned int status) { return 0; }

