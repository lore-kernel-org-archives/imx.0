Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A061FF2
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588722; cv=none; b=eI5Dmj8l49TUMqqCzQe9nts/Xa2EEUQHPjRDiKDGDAaoWynY872CY3YfcJIczbrWtYzFamS2zqA+qrzRZ2188ytuJdwLq2YIT37RTFxDftGi1jYgKhBnVGH82XImtJWVB8qTHdFTCDsbTrrM9Oaq1GkZ6WQozX0k3WTOv1yHRlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588722; c=relaxed/simple;
	bh=s+wGkxQdQOZAumMeKgpW5m+jjq14RmoCE/zy+aB2ZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqyd3P7zo3h+Cppmj6A78KRZYqQRer/Oc35+I8UofZ5w+tbr6rFAIwxdFKrVFORcXK1zlZwL0aJEGG8kpF0KP42PSFZUpwYMGATo2e74DiBcVwnh1150u5HXYhz/5TRBOXtAZ8IL1CcJbH0eiVd6oThh99eidM9hR7F+rWd3bKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=env9yBo4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="env9yBo4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so343182566b.3
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588719; x=1746193519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=;
        b=env9yBo4Q0VvGXYScd8iE0mqkoZgdjzIgBRGilVK5XL/LV4Zmkwp0tVj8XLFFFdCbz
         vCJj6h91Ax7GYBaMEdrpkTOm25wgOmGuBoDlRR3arxVlQTPc3P/ko/m2lwOglLXfVUSQ
         dkobKlG74xVCqUIuKy3+ZXK/otX1lnPoJnGvJyDk3Isk7oi0aP19UGn2bbjGvjUxM3Wn
         /s8uSycSe5m04uxvrEO68yZE2fiqzXP9PAOqEYqut2OsnAWnyQS0NUfm8f88auAk4LOy
         +rDQCOIG0SZ7XqJVYkYfPCFiGpKxFOajdwPcdlvHXU4Tz2j4TQYFm5t7r4/+goz0w6e5
         2U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588719; x=1746193519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=;
        b=PGYdixrRRIC20AjiKb+Qw1m0t8P8N4JZDNhJN2yQiC53n/jUoRge2fuh0IVYm7oxfS
         CUhRzu/LL6zdffyp7cF8ZNAfmO60uuXqgH5myJg8AAKUSOCDiw2y1Qu5rF8pVFBop31N
         heOxmlgtNhukZYhXfFp4rAxdsaAd2Fz20nO1Y4KmEnRZk1j+jB+9rrfn885g5mvIsbbx
         k+8W6G7N8WIBRy9ZGe27gp2L9pcZSVPfg4ZF1NifhjZLeKQEo/KJ5oHDMy6mN1UXsfrF
         RfRPnU8b8Y7dVpRIpym6NUIJcmYduly4ioQp5VasDkGaH1VQp25Z5/p9uRoD8r3aSp7V
         Ra2w==
X-Forwarded-Encrypted: i=1; AJvYcCUeueOaNLG6QygGckw7/Miv5Wz73wEpej6hRgorn2nmbQMehLj4y+DYbp0GZsdAuS7hJcE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8FLOo4BAwnX1RR7dDSCof4mYLprazAefi10vM9PHaKvMpI+NL
	bJs0uMVlbIPueMKxAOMVMusvCayQblyNndoaUdyac71AkFG/gLn9
X-Gm-Gg: ASbGncsb40pT908ppTTs5Yk2hBBvUocoO7Ov8C9705ZS8kAYPqeJ8ONGeQS9w7ouT39
	kTdwSc+n93FoGJLFMQ8ohrnTArVdUZm1CqWZm74sx4pBaZgvKB4ks9y661eMsjjAvrsjs1jS0Kl
	hv4siNePaR/1l1O+TCeRmjvdheUZL5lvm6p7NQ8skjP6F0sCb1OCD7EmvJBvN3OcsST+6r5QUlo
	7NrmXkTQmNWqcCZiuG6IVsoVmmX8SIrTa7ymaRsfzjms9TutbwcEnipsPD+thKhb7Nf4KPgI1uv
	/Lgsyfrqfwpbtv41Xm017CRT7ZJu9M44Eb6v/0r/J8FvXt+KgbOHY08=
X-Google-Smtp-Source: AGHT+IGNWxosw6tYKct4NcUyBZgI0Q/yEcMUb40Dma2Svsw8igWh4KZ3iIt+8W119rSVYItTMA9Veg==
X-Received: by 2002:a17:906:4795:b0:acb:6746:8754 with SMTP id a640c23a62f3a-ace7111ef01mr227275466b.27.1745588719048;
        Fri, 25 Apr 2025 06:45:19 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e41cb08sm143849366b.19.2025.04.25.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:45:18 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:44:25 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8qm: add ethernet aliases
Message-ID: <aAuRuVq92b1G0T7H@graute-macos>
References: <20250422100239.58799-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422100239.58799-1-francesco@dolcini.it>

On 22/04/25, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add ethernet aliases, they are used by the firmware to set the MAC
> address and by systemd to rename network interfaces to predictable
> interface names, e.g. end0 and end1.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
