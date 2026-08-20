Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314D647F77A
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246136; cv=none; b=eedp4E/Cxn/PZ7uRzQj1sWI396vWxFmzAJEYP6oqkOZDpS08S2oOS5Q0+tXwTN0NQMUQrXbEUtH6AqFD8U9zS5NFcXeEJCnVv8Jq9MpSbieTCV5oCAuN3locllK2i49KZuDlNNHk1jtas7vriK+0uC8Hzuyz1JHtN6E8nyeKb8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246136; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncQs+RdJeAomVRW3ojyYkOTKUHzgcx6FveWD9wyI3ALkYXkglo37zskUwVYfCNRe6gDkMlFMjIVtU7ISfQSrKlu3Pnnoy+NsY9deKAiBeFclM1zNF5Bn6tJEC9EvKa0Tasdqj8Qfy7m7yiR0ibpKk13b/AyiG4I2iWgOGxjY6BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPoIXVf+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPoIXVf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=fPoIXVf+77RlPXLle9CI12IMDkb/k/iv6PSauMft9xTVx5kKI4CsDluWRe0cpDymrdf3/2
	S9ht1O4pkazLX29RJB+/NYwgGyHxB+4Ix+WpoG9jZTffjMYdNFdjWrMb+MybsXf2ci7MW/
	PVQ7qADVs3HcNqeFI1Xlm7KQLw4xC7s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-8qcu4SSDOlSc2YJb4hh4Mg-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: 8qcu4SSDOlSc2YJb4hh4Mg-1
X-Mimecast-MFC-AGG-ID: 8qcu4SSDOlSc2YJb4hh4Mg_1787246130
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49554715277so437125e9.1
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246130; x=1787850930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=QjbkDC4dDo/cj+lRSCLw2MeGKnbIXSr3kjxXd3ZSfbxFeAVrWJ+oFFs0r7uYyJTdn6
         Wrh/IRnzro4lNBCaPu65azPAqVP8lYqra2jTau7EWYrkL+gMwrTdq7tIgXBinWpAFkvK
         22yZVkOrJ1evgSW0XlIs+5pTxiHn+65eTCzJFKXYiL5aTEHH/MzKdlESR+74aPQvAyT5
         kSsgoWhz6Nm7109WobeLhFW4AkpsX2AwzQehtFeiGDVuNAQnf6Pq7KjSncD+XmLM9NRI
         LRZmunbNckybZGl7paObr+NgC0T1KwsxK2azvTKddg83Actee5GStL/00j9lh0N7JrAC
         k0CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/pidtTNWfrU/ZxKJOpFsIlMz5jaeNAEQANXwJJqwEJ+DiivkCbsk6M21rV0zJa50mcQo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxB/hwBLxMzn35hngbBfyvGxiH6uID9V5F0jCWjW/rXbODQZKB4
	6mJoiHb/JM3O5ZpyHf85bPzgtcL+EpqJnRTY+kSNeSBuJoPJeKn1fesreFO3wQGe10Sh8tLTDKf
	5grsjud7MseIfJ4pA1b1IIB1LtvijImASBe1RRkYHu4ve0+4wpe2Awg==
X-Gm-Gg: AR+sD12ttd42YhXaZXM3UkanQqQHaunvdw1OOysfLv0tRXVpyi4R4/4CFnl1FI6G9je
	ij7ihDpABPJwv9VLCuqTV9wGCRuOb86xy8UsgYmKcPhpa1gXmbfAHTIvTLa9nGCoLVgtj4EhHB0
	8Dr8qZ49sYNSO0WFHQz99SdjqW1vUJAle5+Ilywv51QM8qjweVq7bGefTpNYXzKIcNbgAAbxyGw
	Ftf7c40z69GIckuqL0UiM6ZIh2RRjp76tc48f1osEqC/kiH4/LYNvrQwihD4eF8UzVakCpTMrl3
	pcbmUuuA02pbWZXUqXipEOiBUKAF0s/qkievoFJlo6LX5uBPlaqeOPUogS6CgIEyocUB0zmXtf1
	2aN6ugvPXnH6z4u4Yei6Wp3w3JFypBGUHRsqLuUyeBAJQjA==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6845245e9.15.1787246130257;
        Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216;
        Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
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
 <20260818125012.468092-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: joleBxsgr76KPFkbZPTMFOm1YWbTqxL8mkTcFIX1PjM_1787246130
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:

