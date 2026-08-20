Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792247DF85
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245532; cv=none; b=pnwoGlZP6XKDgdPa9Glx8LYlyfvUckRZJl7aKE9Va3ZBFItPDgTMua4KF/d7yJUziZFpQgjPzeO2kmhjmmBd4j/3rZSQnt2j1q7kOHo4Ar19gdsh4OQ1ar5E4R0Ejxc3cEUKVVbMNWen2jgfu3VwPi+6Z/PBaolkyJWUZBqOsjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245532; c=relaxed/simple;
	bh=OOvAhEjtRhOw0a+UjXxcotOqI4sqWEFsEYl3cZ0ejEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Md33SP4ZAKHlIIPz+yWEc3LAMd9+poWvD+sBFoK/UpNq4Wd29bSz23SaZgrN/8r/Ctx+h72ncOXLs/8mtbP5RKW2OEZ4j6XPT5LgEcZriBMkyRUgkApEYU2GrpRQQwEqk16ulyCwggSc2cw3YbtuCBAGEik7/2HynBDl3tmz3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5UXJ5Zz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5UXJ5Zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=P5UXJ5ZzdYGSCxg+npYHkhqS14VegimnC3OpJV+zh3J/XY6V6w0XI0O7fyNUgDyXFd86Xw
	sWkXB8FxNoq0Ar/SjNSmoH/B+txC7GKG8FsP4iJTIAyjzGVnPUicgBDChGVO6JUGQASW1S
	KQjyW88P5MkH7Ik7DSfR85cnDqRJnoY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Cr41geB9O4SdzqNO39UAkg-1; Thu, 20 Aug 2026 13:05:05 -0400
X-MC-Unique: Cr41geB9O4SdzqNO39UAkg-1
X-Mimecast-MFC-AGG-ID: Cr41geB9O4SdzqNO39UAkg_1787245499
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496b6f97676so349005e9.2
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=qeauqaFEUMuQNEiIO+g3601BVaXFYbh+ZPX2AVtObqejVZr/0TnIuvP7BxRitZckky
         sG+MCWHzNhqqKhC6cNx4G/hzHsPPX7odPPyezs2v9bzDZKc0BVT4lT2vNWfg7ZotnOSp
         X6AS9gD9C0e8Mw5UgZMu3sUW0G/ikAw9pHeq66l4pYcJ3fW2ZUgunPbCCPwvGlmeBcRZ
         /z6319egrk/dgxDrLGoNRgR/mN/azVM7yqGNz8iSLn4yaXnJsRG/iZ0H1jNR8u+9BYeY
         y5uCR5sbP0Z5EO1geI8JCm4s0raPc7a7/hr76Pwd+MWN9vvYG52f6WMMkfvBbsDBff8b
         j1UA==
X-Forwarded-Encrypted: i=1; AHgh+RomttleECivbJsUJPv1K9RJllfQ5Yoi2/A9S2Hpyy6HJp0xXHv1VreAEcf8BrPtdQrpAxw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfL5nYI5C0Xq6SJSLUpkeP0KCkuab0mm0TlyWiRs0Cr9Ud8+/v
	yhpkeIHblv0xZcr6MNBo/RuBV1wIrdvrqNGMmMng2j/ZyDEuONHPHe0v30BGGP8uE2FgcH/pctw
	x6xf46/7ivTwS4YtyW3QMMf2i0tB6VJ7OyeNGr4dB9oaKubWypuCvcQ==
X-Gm-Gg: AR+sD12qTzI+KdJxDUyXFRQOqzs8btjN7Lquw1wWspps/pGhl3hpyU0SSQRkmIHWihY
	snUPB/T2Pi1eCzOqvwhPhlAxzLtkO4JRRCWTPo9H2W6Dj2bQXSEUPnBKvJxeGyLoY75pE/vJEg4
	TMJGRM1F9BlE83vQEWEqZoGeBnciyMeyi6lmhY4S94RxxxK7apsl5puX71s8rMEfMdGgGmjw2k5
	y4UT/cfA3zcKANEsWcIX2xIKd6cnVCOWa1rdsAVfYfDTCgoVU2pXdrV9F6PRoiBHDnumHsdNdcA
	tTmbonitcW6f2zyYwWjvCWNIZp3I2kuxy+ZMyLzGL8sYbcl4aFnToT+aPg5zi5Q3PMoGuKU9t7V
	bbp/pnu6PxAKCqBF34PQnK1xC6JwV4nvAv54jBYs4tP7KyA==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5017115e9.10.1787245499109;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9cLMQoh3pn18OsWVuCg7T-evpt7GSPNhDvPmPgR5e58_1787245499
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

