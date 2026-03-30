Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C93AB277
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858541; cv=none; b=VTY0/VWvVj0VkbfyiRcdm3X35R11DAXD6wXzKFTcr+HxwKns+BD77t5qBbJaNXMqHRpwlIhxBZT3OdUi54p1DD/l5b1vaE7yj/56YxK1Jjok/YVIDd1v8D3eYYEsIst2dr0N2Gq0Ob2wrz0agOAlWipwYSTcEmJE6UQHgP3FKqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858541; c=relaxed/simple;
	bh=n80FdRj3PPfLGJfhL/LDnOu3GGohFsmLid/HSzbkX44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElUahrTgsgxLrsOP0Ss44s+hRaLqXg8ZO9jyL0C0IyYJwaBZKBsDElIS5ZI3Q3Eebd6E4pJeWVrFD1+EXFUVzdQjuuSkLNw6HvoDUJNF1OL764UldjEm92oOtDel/fNUUVVRuxWsD06foT0pmGl77Dy6TuhhgB1frlFSt7018l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTEUrSbz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTEUrSbz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so40580215e9.1
        for <imx@lists.linux.dev>; Mon, 30 Mar 2026 01:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774858538; x=1775463338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=;
        b=sTEUrSbzOSuZY7XERF6TG7DErPVIa87Dz7WXO2dg+V6kRyVB/aKJO13/aquu3kloUr
         v4GzdTKm6WT+CqQerLoK73rSnuhKr8D8qsNWY8QdNuc3EVCkDE3APAVatIoidc46wp5w
         uG8mO6uMZBmf2+k+iLIouFDP14naXvIw33VavVzxUOKvWZ87MVxqpjYYUg50zRohP715
         d43q4pgey17nMkxsQJQWNtJlC3y84WYd1DPqdCPfXjVR3klnZcV+HbgWwhXX4mUlhjaB
         m28HwuIkSOppZ+9b/rkLjplanms6BRgFkMY62tq3BsogFjYomes3GEjttRZv7CiWPUDh
         ZyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858538; x=1775463338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=;
        b=W2YdYHLjaJTc0jGDp1QELdWOCgHqisVsEdVSeXOB6efcuvr6uCvLCxymewGTIIeF/P
         F8fMdaCu+Rg3TvtjqhYD1VAE5xCvWwSAbGuI3sXud7Lig0RtFQHNHNpWrJLtlvS1YAbF
         2Bk4etyEemyaW6YRLzbMbE6Ii6nVax+wy08SKniioLpomExt6Z+3AXc8Vze1aFIsNWVi
         xJDsj74BLamoWW7v8DR6WetgdPfblHNipLaV83K0UGzuifnmbyZ+uDdEKrwROdbggGJt
         hvIHIUMBlHiCKG3P061uO2tXh9IAvlYYsIiQqGrOM7nF+IjgBemnZ7Bp99mdUpU+oFgk
         8b6w==
X-Forwarded-Encrypted: i=1; AJvYcCXai5Gu7IiL4UspcD7mnWKOOZKd+Ppl0Bh9MS5L+Y6utTj4w/i8eAIIjP5UrYr7740mAQo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwflyYTb9f6AjCw1YlDJJwmgV/N9nvu0T8Q6ow8Rp2JJPMSALUe
	GqbKRM+qv4olq86zYdhhcQpcIRX5zvHOhtGXQ7WCHcOXSWgiT6mZ+rqG
X-Gm-Gg: ATEYQzxrX/uXI4dY3SacZXAYYTSiJo7HJ+XaoB1w1AM1WvL5xPAAZEB3xFxmnG8Oub1
	kNm/17SSUuIa63taJTmH7FcZheCaK9hhtdFTUmHTb0UFpfoGjWRJXdUZDXVSTTkYHd09y8+enhY
	7Am+mjHhZeKQPmTTj8iQuteikMS8Hd0Xkmvf0QF5M6Jj/Kayy1ptlsrK3+Yyl9hQUXoJp01+Lqx
	cKeHeuAiDsYE14Z0v0smmv0qXtqPLI//XxubZGjFMZh70N9EJk8EjFN/rSdK9MGz3R6v4+rgJIe
	W+HbvN7NfVvnEUj+lStsDFqkrAqMxUyNtgk6D4QhvBy+GrunM3+GP/7ZFqz0XMNUdiu+/VBLWB4
	i/4xCM6g3d0ED9semZgQxxuVkdjvVfANjRMx7Zdc+SzDf1r2bH871KfL2JB2p4l+UwLhGYGB4u6
	g+UvNYtUOHpHUoxsWfkdNZe0054geGuyU5rMGzyL8LstJwN1ZQ4lhl1xlGYB6fj2v9ceTzugGdN
	8OER9mB6nmuNNJM/Wl8OUm07LsopomUjL9jFVj+ioY4
X-Received: by 2002:a05:600c:c172:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48729109ac4mr162979685e9.10.1774858537664;
        Mon, 30 Mar 2026 01:15:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061ef41sm168098415e9.3.2026.03.30.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:15:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:15:35 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Mar 27, 2026 at 02:41:21PM -0400, Frank Li wrote:
> 
> Accroding to signal name, it is MUX chip select signal. Of couse it may
> connect to a buffer's EN pin. I have not checked your schematic.
> 
> If it connect to MUX chip or some select signal, it should use above method,
> even though it is permanently asserted when access PCA6408.
> 
> If it connect to EN pin of buffer, regualtor should be good.
> 

Yes, it is exactly the second case!
It's just an EN pin, that enables a buffer to route RGB signals used on
the DART-MX91 som only.
That's why I think regulator is the right way for this case.

Best Regards,
Stefano
