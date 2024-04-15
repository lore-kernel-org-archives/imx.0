Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9008C13B2AD
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185619; cv=none; b=bnrgr+FI+MZdGsvy7t5AA1MThtGAqGAbLK2RWzTRTHKD1vOVvs0Ks2BrwbnBcK8332jV5EP/wQCGdnwED+i9jwY3yLt95qmZ2n7JOZMUsXPh8IYc8UH818T3U6rfewjdxnLp0XQtmwOH1Gg5pbH+zjr3VmdUBNoCL0S1UOTbHqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185619; c=relaxed/simple;
	bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT8gYbiFksNBEzA8hAdSHRzeIAo4N+5wJFy8ofQz9S+vQXoTWRQYIL0Q0STbvH/KTr5dzufNnr1yXKTEUuh2odGEZkOx9KkkEZ98plcmtzfW0OX3mn4TMIHatXdusIbSvPSQ0RKiMD5jhLXbiygkRu+iia1KDC9YjgtTr6EtfXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OrQxDuOY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrQxDuOY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41879819915so2737795e9.1
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185616; x=1713790416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
        b=OrQxDuOYWoLFj0XhzRB4IoKl9S47Wk9KNSRSyDIOsPtOwPXz10I7thTjKw/ILsO6t6
         dKWRd2ENvVnmWSd/V6aad8fWhgiLgtKDqRodJyfrsRUfxz/tiG99Frmqivp1Jx8r58U3
         uqvGUP6O1llYXqViwKVL/kEmrkcaFmuAdIpdRexPCb6Gxb53FKeMsYTWC1rZ2pvZkVFV
         EYxpUpiCbHM+3N4jrnikngz2nbppW2PT0BO78+SE62qksfIQ2G7YwnRzTBF0gToHM0O9
         8QGdLzNbhIC3Qxsaaxm//+NAPwpB2S+qVfV6oOb5URloxJGeEuJeJEEcUKrGqUm0cxJ5
         F4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185616; x=1713790416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
        b=YxgO1Gmw1SDEOxv30GxGrAK5axgdrO+BMR41OX5UJvWwN5ITC0ZBg9Zd1qVHiKc34m
         02yi45rLfM7rBNUvmtOi6vGsQzBo6ey8J/0S64OrLCSLNUlhO8Ii6a4xzfoVqS/HmqQ+
         Lc4pNXQPCtr/rguIuDnIOUr2evNpWRrq1rXG1lKc4uHf9eRXgzE+HoGb5G2Azwl8w4xO
         27M2y2/irBJ7uVJTVgcMBNinBuHp56knhRTJwgCObeVYkFWe6x39MItn3B6I2Epv65r4
         W32QdWdjjPUYUh52T+EB4ZGqlKlLfz0ZS0oLzgKxUDLztNzbMvd4wi6WWbEkLz4Tm6Xm
         5uyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC4Qqfz/Mve1LoIRRcq77dN/PFXtUNbNpWsNqMR63He5zw0TiKv4RYUHCfOiMvrb44pR6RtD03o0ypulmdfsUH1v1X
X-Gm-Message-State: AOJu0YwaJCachAmc/4vnfJb3kfEfnzdfI4Jca89u4shc6M+1KTwrVp77
	9DD+hnRfgCgJtZXHkIlWFruB6Aw2au1JzVr3i5SUjPS8N10MmEbhLFpsCy547Tc=
X-Google-Smtp-Source: AGHT+IEN14JC4aKAm6IoQEiJFrZ1mUtV2GIjZnWInAUAurGR00ImSNVfIpNW8YhhEhxbJzeTLcDKvw==
X-Received: by 2002:a05:600c:5114:b0:416:605b:584d with SMTP id o20-20020a05600c511400b00416605b584dmr7777987wms.3.1713185615753;
        Mon, 15 Apr 2024 05:53:35 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b004187e71bcd9sm681454wmb.30.2024.04.15.05.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:53:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:53:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 08/18] backlight: l4f00242t03: Constify lcd_ops
Message-ID: <20240415125333.GH222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:06PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
