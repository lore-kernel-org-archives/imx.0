Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347D9476CED
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245968; cv=none; b=LhB5YYnmGxJgwUFtsZOZNK2xO4fxrKceXNI2cTNFf5h4UfuPaDqsKhtH6uJaGkrQq9JCvriAhvl1mS+mE2i91IE3FLIPXKbAZyIOeJfV4vQoTNbELpGWLIu3YgBVToMlCmBr9kmO3ALC4rICX8EIUwCkoernLUMYoev0CP8f63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245968; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXsW/rebTehKzUtAQUiMx+b8jqt4t2YTjE33RBIQBGYV0XxmIo1uwnV7NPOxmXNNwVuzkCOmRGNUbVn7wtkzkaUVAlQKWwfVWCNyz48dFBgc2fmTSBsijcsjs4eMoxrd7mjrG+/WtzI3A2UDRx/DsfQYNmm9Fp0faRuqd8kTNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OAGppdIP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OAGppdIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=OAGppdIPrBHEZAsNnpwMQ0xjujJgwJXEXGSeb8hdIrCvXfOOoVGJ6PG3h5Gl3HtSItM6Cr
	pNSrj0pluz+a9/b/55ATbBHBzrREBbL4XqjkKJG4ohTAaggb1dGBSPMIIh/wVBOm4FxFCC
	QFSR3ScFHWZSM4PdYASPNVLdsng0CDE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-8sMf7HnTP16tMxlyIkLdiA-1; Thu, 20 Aug 2026 13:12:43 -0400
X-MC-Unique: 8sMf7HnTP16tMxlyIkLdiA-1
X-Mimecast-MFC-AGG-ID: 8sMf7HnTP16tMxlyIkLdiA_1787245962
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4957287363bso472575e9.0
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245962; x=1787850762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=slTukDjysUZz2XOGlzg/Ke/qnvMB4Do5vd1qhjfBKz2UHBU8YLFTx1w/xvKsznuKpP
         gI7+B7qTRfuRc2kbOXD/cmehumVlZqLFCX9VhQMdb282EoyKnFTLxX2n7YR2VL+9xGLu
         1vCjTiLssfLLFYjXFcO8Rt+ycTX0xiooeVmGZYlhQNWkcNWGM0XwTk1mCCT+kwWXI342
         YhqPCu0iQ1ZZ/ToPWn4lBO7wyBc1cCh5cLi5x8PA1UMXrkaPbHJCsQ6s/LlYz5gU356V
         wS4m/m49RO3bSUTa/NHN1vcasjHISLN9cFl94uXDGTBUl3ZlvNaPUJlVfGm1WUDFbOrJ
         6jyw==
X-Forwarded-Encrypted: i=1; AHgh+RrHR2YCm2h6nuGhrTd1ProtP6EDSxCbdyz4BIR8SUpZFKBHcNwuYKBXkvgQpIbQuR8awDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YweWTFTUGrRG6MflkuVLGIhY/KwvknSwvRKYMneo1U5YzdQCS6v
	dbbwMRFWvabLYolLkf+aypZR2DMfTKsW0ZZww+Od8ZKJgmOTZJJb3eytDEQE6IvBJuUEZNFo5Vh
	IGW5tOShtLoRPyceTzOVUm+yv5vbuPC0aWvlvsUM4qkn+6E0FO205qw==
X-Gm-Gg: AR+sD11E/gZlpT+WspwGToSoYLMnzLbR8J2GClooL3e9ZXjcSSDUkaIlG9evh8ISVEw
	Nrh0tT/SnTOOcBXsk6q6OoUfhCvx9Mw1yCZPJmpRkSzlcvhc3ttn9ZW2UXcNwxnFX1/UXeuwoHq
	7mng1mU0CiFQJ0Vb1h/Ft9F9+DV9BekWWkA7R0lQllbm1yqLu+BLu/zQS5bWlyMD4VbvDy7mTtj
	ZgdZgei5nGHTMd7e7Vi73CczXbFTkFT84hHCOpXMESsF5suwShY/yUfGOinXnBZtbNUYDs1Iult
	PlFyvrhyTXeWcLumqxgPH9n5MoMSTwc8OnWvzQgQ7gu2BjrywKVXplLbCeWaE1czMK3EjBry9rk
	K0u3+Epcvq0dJlTzAx6TSZvnz1zMw2gQ1BtBRd+YHh4w9mA==
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7853295e9.14.1787245961742;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7852145e9.14.1787245961316;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm168153685e9.14.2026.08.20.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:12:40 -0700 (PDT)
Message-ID: <b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com>
Date: Thu, 20 Aug 2026 19:12:37 +0200
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
X-Mimecast-MFC-PROC-ID: -16Yleu0f22apro_OSguEpjBmtl1HLyBEmFFQfgkWME_1787245962
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

