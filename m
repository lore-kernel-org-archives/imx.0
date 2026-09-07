Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232F40BCD1
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814866; cv=none; b=d+ZTqmvM5h8qqqwUubKmGLtNytH9mAVMAOW/C8KYVRRWc0CpjF2TTmJsCuwORMQ9Z72jwq5KStVEBjQ6/dssBEMAR9uNgVDsgH4Yb1uriGrl+xgMVotmseO9cAPRBEuW89KqM6i2+iPTtblvqow0N27afHbuOdr7fyhVzEBe0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814866; c=relaxed/simple;
	bh=Pfp4fHaGp3DYNoQNsq++Hih2POFfdEHNA9k/g4/DYlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX424X+6BbogoL0oGB3C7EdZi8ttl94smUrF0swcsZZNPA1IvFOdsY2vgzCUAdWGMgmNubBSqRm4cSDo0v34fpi1eXWPmMuJaDUoOVKz2qd6Y7gZdWC5lMoNMvdfWpkteJYpyCIKn7oxDHgKatAfpkQdEMwnGOZqpWYV7B9qqbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4srLzoR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4srLzoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788814864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
	b=E4srLzoRT2lSFcaQysiCLk/7gYWQXXHBWble0pc3yRK0BKbcUWXlkkenZdQBdblXltv429
	aq23hN2ImYmLgJhVNpUkK9ErT/FV8Sa0bc3WYo3Bf/cgSD4jChuPK5MW4huzJs8Xh8G3m2
	v2U/A6AYyGRGC393cggcW25+9qGapb4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-KbVqgheFNx6Yr8ij8KVd4Q-1; Mon, 07 Sep 2026 17:01:02 -0400
X-MC-Unique: KbVqgheFNx6Yr8ij8KVd4Q-1
X-Mimecast-MFC-AGG-ID: KbVqgheFNx6Yr8ij8KVd4Q_1788814862
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4855e47d062so2429131f8f.1
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814862; x=1789419662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
        b=eYq7lhFxJs96pAUir4nLHw6lWuRr+s59xMjbr9OidxEiMgBfJ+eNDMZpCc4xexoxyO
         oOmqPkeE+lHirhz94ytRdNGwpU5rT0avOzmcI7R1YfWYIHgfy2VV4B1K+fiNVgUqRIhg
         azkTUIt69N0a8G4K8pKloPMb08aRkiKu4nq9eDJo8HOwHykG1C8J4W0S+6Bca3S+C9Hc
         Lew6c03D2Lpx8ED78lsvYrlfvh0MSSWT304q0Xg5pvogplEO+C7okxgLrwUf8xJ0iJG6
         RmYUSAPF/vIh6Dy/BiJ5yLUjgxjWVk+5r3Kq3X7gf1/0SR9hJ8FOqMiDBJjmFb2/tgsP
         5RFQ==
X-Forwarded-Encrypted: i=1; AKwUvByupNkdWbN71nEAra0qmYNE8eqeKJz6AIJkIrlEj8TYegOe9wwm46oS8D8ZR/COjQ6U740=@lists.linux.dev
X-Gm-Message-State: AFuF++n1921pQYMvepq5qzliJzr0gRUge2qF0fBxTdDi8x/vGDRuaj3I
	Bdgza3Aq0lg7Ym7Z3sACDqnbEyuGwLwAP6aDrbKCsZhfmwbjPKW/2buXhoUccVIwZhnTp0RFcLx
	sw00xoukeCMKirLBbLqQwLxRioNDzkxcyNiYardo84+Fao9jAbIcZKQ==
X-Gm-Gg: AYBFou3TH2YtRbCnrksvSYyRgDtehL/WPQ1rCcts6EsZr3r/vCv3jGXNTcitc79rIgc
	MaNlEvVNa45asqdZbNOuWGWRzoDTStw+Qb4YiqgsZLecH43XHtYEmSjAUYjsTN6drHutJWlgyD3
	45gN8fW/2sCXfwuU33zENk4ntptryjG6jRbzbBuJ5YSVWbxUGOVUcyAJUKAXr0+x7RJA4SleY3L
	QfPmrGjLdwApZa+wXxDmFYMHMydOAvGYMJ3gfPfY9JHkatvcHz7AgzfzLB2GDwXRboOzWrDYNB2
	8gbMzkmmvwg8FMy7zrls4RFozPEjK+jEEB7i0YM5k/plQc5wf42Q37JbYTKVZafJms4s3Rw935l
	TVL2wf6k+2YLGHSSdkYSEHYTGBeV9dI9lmhwMr+nKiyI4ZgzO
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167275055e9.33.1788814861696;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eviq8kn-Pw4jjUIoSUbxF962lSpxJ8CQsMy03P4sS3Q_1788814862
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

