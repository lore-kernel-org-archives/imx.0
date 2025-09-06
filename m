Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C129245022
	for <imx@lists.linux.dev>; Sat,  6 Sep 2025 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175674; cv=none; b=YL8xJHveGiP5Mzm4MUSzqpoqk2aecaNeTVz0k7eUs55FUBsc+425fIoDyFFrL7WoTP+6Q/ZfGWomRxkA5qM0xdN8wMoUmIMxn85Pm1qBlRP0clGDoarTj4J3g2VAMbx+/CFko8JZ7//vxhrHyyXI3I2hALhueSyxWfJm3J4EAW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175674; c=relaxed/simple;
	bh=2ynDdE05Uu0V18utDLJe6rKmpr1DVZ5MyG+kWtdhmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5m8JfdDU6mqFopSLkUd+j6WLlIStpazVMcQJ8VXaWR7KyQeZtMsHRWgO7ZJTD5j35CLmt6iW4k3eD0eWFK061MlDY94Re1qllwAXmJPTFFiL47WAAJauKqNnFSZ5Uq0pFo4SxBC2uFSeMnlOtVv4sBKkGLTLKHmtW3ZI5gsDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkZ9I3r+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkZ9I3r+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4c53892a56so2750471a12.2
        for <imx@lists.linux.dev>; Sat, 06 Sep 2025 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175672; x=1757780472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbBN/bObO6Jlu4fh+8gK6wcT0StMIG2MNueU6l6qv7s=;
        b=FkZ9I3r+5keE2Z0Toy4cQbWpaNq+i4s0gCYPWxmu0nDu6YPp4NFjVkZbftvYVouQRk
         nby+AoxYShebJ003r5WepU6oBqevjdH6uiJEkwP4M3aTZmGzRrvXZZSDI3yjV6K9B0UT
         2yuEFhb5khAZ9XWjYEGJAF6QjmswxRrtS7SGvSLaunUDpLdrJUDmz3RiaeZozrIoAM4q
         R3RzJ/nxuKN58oCrNBDLXOk6Qv5PsFUuriVLqfrgpeg2rxhuYNHm7Wiboc0imMo8i4c3
         YpX45YjhCOdWqdIaKXcho0OxT6D7EPedu+/2AHSAPLD4rJIdA81Ep3bIXVHOXtmLNE7t
         AFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175672; x=1757780472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbBN/bObO6Jlu4fh+8gK6wcT0StMIG2MNueU6l6qv7s=;
        b=c26i1rjlYFsSGHIxLafMXZorikMVnIHGhF3pjMsulfiTlKtbZKewtcEPUBu82rgQYp
         HtuAFJRPOY9B3ADw2k8pHVKiwMWYOqEo6hq1Zio7RkMyG1W2BW9iYDGnPhwcv+prf1Ht
         kS4pb7wuJluM5RAyWlmea4/h71+MjkHJ8YlqeJXAKo0DVFFaYoSZcZDrVBicuZ6bh4Xs
         IX69HiHfCJ2TjGqtnEOy4AD2P3hgY/anw9/kt/nUEtwL0TOaVdlwe0x954bln0GesuEA
         fjBNRwLfFp12NBdokTc4LP5NbwlfIMn42/kfucVCQThe8tZAUC/V+Ld+1z0uIPuwz98h
         zwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/vSpH+i7f4SokpFSQpbjvJHy8fh9mDB8k7O1rbra1BVxOeMPi/o2KcjJUfIJYv1CXhhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGR85f8tJT6LRKihAUUBc104OTMEg81oAUJzNmEqMApf1/Tskl
	sRCF4Dpu2lPeCoIJddaY3Wln2PEN5zb+yxTNcrdI7iKrlMdon1NXyBWn
X-Gm-Gg: ASbGncunYr6mnENxw/Cx9+amlDfgUdtE5kmn4+k0k9qtVCoTzSlCjWXP1PQuFNDvwkd
	xfKVNS2Nk9IBiy1iaFlqzJJ/HsooLzUbzyK0IhZiaA69uUEj+cCv8pdr4lxNV2jtMbYTEsxQRYu
	suhYb/TGKz7YmFys/PDzxQa3XKNSwxrNBTNfORUJ79f6TZOqIgDs0HXR1BjBjptmypDYjYETQEi
	zpr0WuhWxLeWynnit+G4YQn/JsZ6iq4cswnap4N37bgshhT/Grz9GjtoDQyVz9AjgZ13dP7BfXu
	QZELOHrAmeUB7t4jLoYghuG7Vgvft6SLZ3mqtXtdOWRzlm82Ize/1hI0wLOvurUgwogqh7B2GTa
	wmSeZSv8OvV5o/j52lW36+NUFbeeDrsutNy6Tpm2HleiA
X-Google-Smtp-Source: AGHT+IH1qZN+DQ27OCHB1U/5HTdy1mERA+wXWrNPxb8O95OI/s6qBCOSDD0GIZe2PFFDC6b2c2Q/Sg==
X-Received: by 2002:a17:902:f711:b0:248:96af:51e with SMTP id d9443c01a7336-251751e5bc1mr38642315ad.45.1757175671543;
        Sat, 06 Sep 2025 09:21:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cac2f24fdsm87369115ad.46.2025.09.06.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:21:11 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:21:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert max11801-ts to yaml
 format
Message-ID: <32bvq4uuwb6zvmk7cd26rahoz4vaz257thlxtsat5atpmlszxa@ppdpssfesz77>
References: <20250904200641.531897-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200641.531897-1-Frank.Li@nxp.com>

On Thu, Sep 04, 2025 at 04:06:37PM -0400, Frank Li wrote:
> Convert max11801-ts to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
