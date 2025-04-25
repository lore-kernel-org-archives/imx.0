Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B0101DE
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588296; cv=none; b=T8O6QmbeqxdzocFXEZEe6xJUKulAATTy0SRdyRaBpwpsyaoWYstYbxCix5VmEMjP0gBgo3PnDqwzJIQc2VBz3x0mjsAZERGz05sAqRbCVtGnrEkyi/Br6+F2BF2KtD3jbDVJ3A3yZo+kcWX0830LIjjI83DvIOeG7dAedZMG61E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588296; c=relaxed/simple;
	bh=05Eptw7UL31YEj9IqzW0QE08a3m874ePycrJ0nzwhws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh6WKRJsmV6/SWguAvovqp7MzjlstANyytNhzCOYXdfhHg7AMrAJHBybPkGVR2eYIPk16VAKvbHDSLGLATgAawG+MD/2NASMdoxe5v0v+SU5gXjduC57/uaP5n928lV6GPWx3Wow9HUoJaC7l23dKju4P3xHICxVlcT6g/cWpt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVEeB6M7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVEeB6M7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso967637a12.2
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588292; x=1746193092; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=;
        b=IVEeB6M7zM7S4GTcBFjUx86fV0X+Xk71VHtxfuLzgb7FqrfgKKvXS/OEcFVZGCW3+a
         mf/hPuvaoW2WM3tuN7upjOOcxtHxgP9xEQTJzGRWqAjPpSSsWxYIqbk++Z6cgB/8NzGi
         p4tQQu4Bp66vP2be3F/FynvpS8V5JBF83n6lxakVYtoP+OQNyrL1G8/AG5nWvDTEWJjt
         +Yzvqr+4RP5dQjcd8WNC6eCTLQTjd5btPG66gmX4tDyg0rOSQJZKYJYWCapGA6yyuSSR
         9bkTXozXADj99i2wfhxPa0Az4CItlH212mhbBu+9sUz3bJa9anv5gRtPVugtsvPxYH/k
         jYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588292; x=1746193092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=;
        b=QS/yu4ahvz1k1sfmasWuZg6Xi15VOrgmwjwwzvT+qKFf13eEwGlWM9Uh7jDt18ZJ6t
         WypC1RzH5Efl4Ow9zZesAqedyBlk4qL3j/YzhotdY9sq7iC5EanFCFVoW3VT8ud6560I
         ADRpshUOix2/z/zypUj+elJXvKiWBk+4R+A7iQ2wXhbW5YAcN7d/EBuhVkR6HcQsaz/O
         g3XyO4Zl+igTvhNEnTy3R3kC4FF3HXXYBgSF9WyUZ9Preu1z8UZpqJJX80i8uUpycApa
         9+C+ol+DvYFHMrYkPeBddLE6vUZWhw9T9SaL11BmYuW+U/+EhFn9aq2dATr/AMIonuXV
         s2uw==
X-Forwarded-Encrypted: i=1; AJvYcCXWVo8cVL3C8J0UmSj4LR202PilbtyWPnocc2Dg9yqEebrIyUeHIZgVFZ/fduID8MBmBI0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+4J2MyPyrEgIIuwIWKkbumDIeaZfrNYWsSLbCnVkqiu9/YGxS
	SG55haYtlqp9+gVDHbK2gOWtyZOHkxE74YHU6SS6buPzfjj8C/+A
X-Gm-Gg: ASbGncsOxIMFZYU95jb2KE3fUCcjw+87qks/G/yNfz7HrR/V21YtzMCYM4E9k6ok3j/
	u4dENA6LiYw+/3KMqJXofjkMm+hgh3Ss/bfbBKzfW+HLfLNSwapIM1BjEjV7f0OF174e1hqRlSd
	uPAzNJyVU9rwQKlkg0k+/QDUakBF3hrjxfMwwH2M3coOXnlSFKAPsjwpbuloI0J2ZZimDqjr2nw
	iGYQUD1Yz3rY3+KFwdVPsrI7jrGN5rPjtuWdd1VorxWXbqSn2l7kBR9As9cBvaxD1iqfHXVhVCI
	blJOdxWU/tv0Hlr0Hmj2QD8cEoQ/Z8At52uKM1ghEmEOjUWlm8lON+0=
X-Google-Smtp-Source: AGHT+IE86Q3+wVqPZufqaFdR5AXK2Hpei01lx1jufnMmv4wt1krtWH2mQQ/n9CHFPIgL61um5nK+HQ==
X-Received: by 2002:a05:6402:2748:b0:5e7:88d8:30a6 with SMTP id 4fb4d7f45d1cf-5f72297c525mr2124920a12.20.1745588292119;
        Fri, 25 Apr 2025 06:38:12 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f70110791bsm1297259a12.13.2025.04.25.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:38:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:11:22 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document
 imx8qm
Message-ID: <aAuJ-qg7ZjZj0LQQ@graute-macos>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>

On 14/04/25, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
