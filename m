Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E04EF127
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674916; cv=none; b=rTuA++GVuX+ZG4i9pI9Y/KImzD9FdBQ/0TvVIGwp4Z/mCtNXoO8BTYZZmfwNq3QlF75blTNHT3wr60BU9vThQVmOaite66xRXGQC8BlxEO0o4QBdySJ2qSZObKtLFl0bw/vJEp9jPBsVgMd0Iw4V6Oj51vyD1gsNKe1AwcIDhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674916; c=relaxed/simple;
	bh=0P2nMJyk5QJYGA4+K5hLhmxCTWy627UxvCFBI5LIYM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzPEEIdKzoStBceZCR70ZQ+qlcv0ilvxM98Pyc+5e6zW36COAohmfeoDrcT1p75E8+aJS+DhQTmdyS/rmdhO7V+4va5cS+P7r2qBDV+YQOJYwujcOjDa/napdiQOoplHW2yPnH92qfonH/f4/bebroAFm2+WUpRO0BoS+3wCC+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buJo3UCk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buJo3UCk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso14227415e9.1
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674913; x=1791279713; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=;
        b=buJo3UCkDTgU60z3jir5k48kzf0ojlfJdumKD9XnfnTHqIAxnOgYOY/OkXO5du+IGe
         YrWnhpONBDb4aljneJAUC1UvUg17rz+3c2Ji88IFD5kq6FdERJ0qFbVnx4ZIyHQgNPAo
         Ic66p6GNwnH5+i5iJNBLa9sIdXroIGglPpiFHJZYHq2DNd1EKy6W6fht88DxoPnjbOTA
         x14juJ64F8DIKVgpy4c6XlY6Sg/f6dZAbNZ4ZP3hFgIzhfitb4XJ8lymwsncd7qVgQNc
         LsGB2QgoxWJgRM+YyBqhiJ0jnQYURnrON/VMI7FTGxfJtvrs81NEV2oliXjeDU6uqsqJ
         QCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674913; x=1791279713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=;
        b=DGK0OcDwvn8kBZSGUCe2gKd0rbf48A7Ym7gYgxgIWwcughvNR/tHPud9OSS4hBwoJQ
         Y8QoQQH/FyTAQoI7mTo0j0zxYJe/Qhd7wySJwVQhf/c2kV1B3RYOOMjIhgrXpDOEb9aI
         Oog7NprOlna05Iwo6LMs/rXUVT/XWvPei37unoqFdPgsd/UWOJge1O/IIQ4xrbYtvznr
         DQl4tC4mgOlnyUY6QwK24368BSZSai21sDEqihJeUebRd8vALbhp4NIK4clJ3X0kwPJ3
         mH6yyGrrS6sDELG0cN0asgzz2+bzw/xhYO4kXVHLLGFvR1CNzS4iDeGnjKQc0pt+MK77
         2Whw==
X-Forwarded-Encrypted: i=1; AKwUvBzA/LSD6GpJHkfYo6nx229j3tMpK30ydRrNaLdU3d2dB0dJOb7ulT2ZsnFLGcDokT95pbk=@lists.linux.dev
X-Gm-Message-State: AFuF++lGAD5/vMFpxSdXfxF3w3Pg591hmIek/+c5Wq5KXOhNnCZM0XOv
	w9H/FOMZTHHhIzS89PVmKh9HEaGLKi40z4YTvsp2R5HSVOvWcHXcAq1F
X-Gm-Gg: AYBFou0GG/X7r/wzBeUntN5a3uCpou7T/idzTS7fUue4M4ktgYA3cbQewjMJuWIH30m
	Q3G0UNPxWQvEFpauxmU7AAu5xE6uYLjesPM2m3bhfUITcsJ/MjVowaeI6azIwwMaarZ0PkaCgY9
	SXn2PlZqftW1nI5T+0wR6vdDIKTiIbrVFHz8FiHhSEfwHMI/49Q6dtMcGIL46NG2BlxQbERwPMk
	AfaqIXBnCoER7f8KU1EC90hHR3F5R0q7zHV+7oY0IVqIifZlR2VKgWSt5ve/I/MjDeSZNzZteWv
	nOAKITowi4DcO5cbo9rAYdujVzK9ZK4xW+VpAXoq0+4O4C0YraN7kNTlOGPi4ePh6Pvmk5HtesI
	1FY+B8doNLNBJFcAXQuDHsaGpnC+ec0PSbvZD9rF0ou8aoLQStE60wB1Y2So0V4Dqu+jpK5oDfd
	7e33XACPO9EcYmFB8syB3afUfXhQrVdmx4ynXqGls/PnbWKL3SPqt4+XGWfCfWMt3a8bfCVJMmy
	aONN5RGUyU32XpaRC55WoX6AneipUJFYyXgYh7IraIfLpIoDvd4oDaJ4mjtLvZ6bIIcOAu1xMmm
	icju2JXrCQ7xKFYXYzoGZP+Z6X2D
X-Received: by 2002:a05:600d:8652:10b0:49f:feca:b3bf with SMTP id 5b1f17b1804b1-49ffecab799mr95152725e9.8.1790674912690;
        Tue, 29 Sep 2026 02:41:52 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm64229765e9.4.2026.09.29.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:41:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:41:49 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <aruH3VNnY8rUYJIK@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
 <art_faJ7Zx5CaWfW@Lord-Beerus.station>
 <c97be589-45f4-422d-a4c3-e5b0a61f5b22@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c97be589-45f4-422d-a4c3-e5b0a61f5b22@kernel.org>

On Tue, Sep 29, 2026 at 11:32:45AM +0200, Krzysztof Kozlowski wrote:
> On 29/09/2026 11:06, Stefano Radaelli wrote:
> >> Also, look at other examples here, like Toradex. The actual variant
> >> should be the last.
> >>
> > 
> > Could you clarify what you mean by “the actual variant should be the last”?
> > For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
> > variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
> > variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
> > I had used the former ordering following examples such as
> > toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)
> 
> Indeed, the carrier board is the last part. Just to be sure - in your
> case the emmc and WiFi are on the board?
> 

Yes, eMMC, WiFi and the audio codec are configurable options on the SoM.
The carrier boards are shared across our 32-bit and 64-bit SoM families.

Thanks for clarifying,
Best Regards,
Stefano
