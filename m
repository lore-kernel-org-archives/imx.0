Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A02E22BF
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557486; cv=none; b=HonhDvGotIVLUziDRvrmeYZCEy7nQ9t98tCFLC9ylC/Z43Yv4COlDximpaoyqwRHLbVbd+dz6jegGqSVdwYA1MaFCBkS6kYFMuOqVUyRj90JYdVwV8N3rhMUcYzBTsq2hFHzDT+AqhAaarI71KyvVsYwRf2xjAN2upvxDdMpfJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557486; c=relaxed/simple;
	bh=lbCZuCRT4lMk8VwiDJS9qwmYIpPm3rZqFqTsl8NKnl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkY7hzbJOG7WOoRmOm4AxIxM2kR3UHKU/DB6xXLRlPrqy9FPme5t2ca+4QcZdLCeGvKZqEvbhHL3UBAK0nee/gF9MpKMHVFpoCD59NWRgx75B0mCl7N/s1OMoBSp6qZaR1a+E1sM+UH1hGlLZfSt9HZgQxjqD7Y38iAkIAyoErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4aPMfOD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4aPMfOD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so27795505e9.0
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758557483; x=1759162283; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DEnMMyTPzSbYjCuENNMIPA0pMqJ+aV1qFH9XDih+9hQ=;
        b=d4aPMfODZNwN67kClfI/AIamL5kw1UxENRCxS+jYThk6lm2Q2HApFDMzLGYEQqlEru
         A4ZuJ2M5iTLIviZUPGqffEnuqA7DoDXfxbjxEXBIq1hnTSZP1mjDg8YxWXU3pP6MUmv6
         G6lLRmPiJqjqy8w7TNLqb9Aw7yxVyodhqLgC8xfOP7yAiiu+2Mo4xGMsFFRog0xafEZn
         E+xewjAj9M6aWWEnaYIR8VYYo7oe29RXiyWA6qTErO66fNkLRGyeyQHcigdWC9C3I8Nw
         qD4aZ23YfycFoVcpwSt31PvV+v/gwiHSbcZXx5KFV8qL9w6X4CQ4f9sKmDmUhMPfxBr0
         A+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557483; x=1759162283;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEnMMyTPzSbYjCuENNMIPA0pMqJ+aV1qFH9XDih+9hQ=;
        b=vslwbhPtd/rXM7c5eY6fRA8XKLWpiNbknQT+i5rXy4xXzvsUyM8HY4rzMUWbDl3FM1
         ShWdVoQK/iDMfkZPAFQlHynoQYkzkHJtm6ezF4ISjG0kEYcpbNw8JGu+VPtXgeWEmqlw
         ZFtdl8+LMEzQlZv/XYsPpsYDOaafjciNFeOIzEnuTpEUMfYZMkTvu8IxQItHU33FFRET
         PfwQ3HJ1SZ04uEvhk0ks919JH+/oZPWbeH+lS+0W8+wj77dzLNZPbBlqgh9KP7r9IuH7
         AmrCVIw8b+70CcrA54uvXpfNeCsPYmEQ6n5mzPmZNqYwvguU2nxCOXqmZZCf+Nek8ncY
         qXXA==
X-Forwarded-Encrypted: i=1; AJvYcCVZwITzPfirPSA/7sB6UTCDh/ZwxnQdIfd0QV5lPV7+HB7SFh/6gDjFIL6aDIijR9HItU4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzia991m/hGH/chrPxUgmN4wSThYCaI5z9MQJtBOWyVOqKpldku
	1se5yGg3WFiI0UuU0LMN0DiadDxwIGRdvL0ojapyMwMZLw0d642vK64F
X-Gm-Gg: ASbGnctfKWDIyZ1D2vjZLECQvzRibfVijukDDCgGofn6/cL7WYOtLp3kzmICSaslrvX
	2hFfZ5DETEA6/ofnn8hZ93zjfb+BYH0VjBHKSgnTBYJoXa2oQis2wpemEAOTVSbFB2Dz6l7zuAh
	xzeD0os3X6Igt4VmEun0SQwUZygxrST2qrBRcJqbSMYZpRIex0xaPvTkxC03SrZcTQ7cL/bnvxG
	m4b33KZCciAGSSOamObRToaxthxgnzaf9eY+LDhPf5kuvFOe9O0Ha+YzgUfVtaOGAVzGiPJpiEl
	CW+G7inqkS9tBDTFXS5IFmEE7mxkS05PARtH5gtDwfXH+PhoY3kvC52gTw8ru9FSHv1Yo+a1gwm
	A1mnYcTkwuIE7PEZSwhJK24LNmvooZUy6bucRMtF8IQZBrpRo+D0JekLk5qOluCQ8zeRXyFd9KZ
	cpGXjIBQ==
X-Google-Smtp-Source: AGHT+IGdiz7k8V0AhAdxhfd+pKps/rRfo1454RdG9IyhVYMPnmXBEYKoLxSXpCioAD2M8iGpREQWoQ==
X-Received: by 2002:a05:600c:3b20:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-467ead6730bmr108706325e9.6.1758557482842;
        Mon, 22 Sep 2025 09:11:22 -0700 (PDT)
Received: from Lord-Beerus (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46de4d67625sm31370685e9.16.2025.09.22.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:11:22 -0700 (PDT)
Date: Mon, 22 Sep 2025 18:11:20 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [RFC] arm64: dts: freescale: imx93-var-som: Align dts adding missing
 components
Message-ID: <aNF1KOCs0eHL1Njb@Lord-Beerus>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

the current device tree for the i.MX93 VAR-SOM is incomplete. 
In particular, several peripherals that are present on the hardware 
are not yet described, such as:

  - audio codec
  - PMIC
  - WiFi + Bluetooth module

My plan is to align the DTS with the actual hardware by adding these 
missing nodes.

Before preparing the patches, I would like to ask for your advice:  
should I send one patch that performs the full DTS alignment (describing the 
patch as an alignemnt of the dts with the actual hardware), or would 
you prefer a patch series with one patch per peripheral (e.g. one for 
codec, one for PMIC, one for WiFi/BT, etc.)?

I will do the same with the other Variscite SOMs and Carrier Boards

Thanks for your guidance.

Best regards,
Stefano
