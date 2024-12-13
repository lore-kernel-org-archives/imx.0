Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A41AE005
	for <imx@lists.linux.dev>; Fri, 13 Dec 2024 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083426; cv=none; b=sE7nbKAClrqcpr124xvKDw0jUQVdeY8/zAW+vE67tbq+u4KZLqEqqCDXGvkPzUrFaXrBGn9owFLQRzjBzhaSAsb1KegsVkO12G114TzmMsABLLVz8mVmz17j2Sk79Ez2BH926nhZbK/bLsCXPG6zc9Qh1YvQqgjZLZL/TD5GymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083426; c=relaxed/simple;
	bh=jv5vY0x+o5FF4JeiUM09GBWAmCzvymPLriVPtjpQ1Z8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dz6RiHKB74p0jmaNH5vqKMI/X47qDppQhTRLEAhb4oP8E5DZKvzH0Tg5KZn6ZQrnUxfqUJSCkn1IEPuioFHOh2ZgGI+L4O7z6SAkPbPEmYJpJavtS0CaZZAzzsy4qCR8ElaJbOS8rpOVnfkwTMvcFrXv3jm/Tzk6uJmpIGGwBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A2tCMKHp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A2tCMKHp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436249df846so10704585e9.3
        for <imx@lists.linux.dev>; Fri, 13 Dec 2024 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734083423; x=1734688223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=;
        b=A2tCMKHpq6M3Ch8AcBq5vc5d5u5Ztc2iFhoIcOhCMQs7hjXHAzko85ACC5L6xKL4Vr
         CTq1l6cQBXwQNrSg8EOyPZij1X5peE/7k6eqtQfQ37R9Fd1+KtHSCSRMJEnmmcYQBUfC
         3MzoHmQ7yCajNnJcpQMbhwxk9Bbw79TvyJ43Srk29tcNi9wek56NvXTEj+6y1FjUHkkJ
         /kU1IiGTQtyliKR3pvKwNoVk7frynd1JHLaqif1D0oAjQi/PxY4F6kkiPZWp/TDUH+cM
         1wOEVEmC9p7r8bOo2d+9bP3oTNzDStCRBMdyuHNzZe6ndu8lB/EqiTgiGFUyTX0urcSW
         6GzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734083423; x=1734688223;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=;
        b=hBpssJdXs9igYj2RMdYeYItKwp6c1mgOX7Lpja6xW3ZVmUnl6OMfc2WwuBrO5iK4cS
         D/phOQ+KJVEgs8jKtLigHHEGrHVXiz1SnF5U1X4hgaG/feBou3MMXUd6SMtLOcm7/8Pj
         pJibmp3dfiTSHU8RH3zMZektgjcHnVDGHoChcWQsnqvFl6UYCUoGIrlkxDSUpTuS0cWF
         TcpPtOhwOAv6DvzAWljwY+6lg6a/R9PEnvkz7DpUyGS3H1hmDCMC4uZyjj/G6KFPYwwu
         yxb2t92EIsSbQubYh7mjkqNSvq/KoM6ukkyFBfvbmpLLzBn26wyC2GXbC6o3qPq+FQyi
         SVHw==
X-Forwarded-Encrypted: i=1; AJvYcCWf9xnEoOimbZXEoEpKIXa799qhqvDM6JrMu390TTotUXiqbmzaDskxeIAijrAqDCpb7Z4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEWam3CT/R+dsbZ9I6eYPlxoP7P5jVcVyYEbJLSRmpYhQSbnlW
	ejSSMEnGw/S+OmAHMggHvS6cxYThmhgmxW5QwUIjuRkELuAMMB7bZwQ0rrOGvtA=
X-Gm-Gg: ASbGncsmK441j5axfHfoBWBYtKx67PkymiVC6n3Mv5lZ6dKQkeU+aIMTivqAZORr5Zq
	Squ34fIGWfxI9piTwSIg965KBenzVNC+MPYvP/366PeC7BqlgHiZQa2Uzg8NBh9P8dYskIpClzt
	E8ABFPH4lSiX9swIv1xZ0eGv0rmO1EuugZPo6f8knn9pbVL0FuVu7pOAhHq2byjCM1UUfklhOwy
	Vw7xWRQlMdC0ZL8bu+NbdOQdbwuqfD3ZPTA59vBPuVl8dCYwwz3ETyvi7f+vHUXgjKDcIqbHAwB
	pQ==
X-Google-Smtp-Source: AGHT+IG9A/KVakoN8guITzQ9eblOlzfndf3qs1MoLosGMewWA0MLS7+7RXq3a6QkML6U748MbVt8iw==
X-Received: by 2002:a05:600c:1e28:b0:434:f8a0:9df0 with SMTP id 5b1f17b1804b1-4362aa3d988mr12741175e9.8.1734083422743;
        Fri, 13 Dec 2024 01:50:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a3e38sm6521670f8f.23.2024.12.13.01.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:50:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
References: <20241210105705.116116-1-festevam@gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add
 compatible for AUO G084SN05 V9
Message-Id: <173408342200.146926.12035228317678634165.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:50:22 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Tue, 10 Dec 2024 07:57:04 -0300, Fabio Estevam wrote:
> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> 
> Add a compatible entry for this LVDS display model.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1c64605fd976cd2c7e4f30d826818a8c27924c32

-- 
Neil

