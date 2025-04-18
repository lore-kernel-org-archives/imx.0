Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335A778F54
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744984374; cv=none; b=GTHv9R1Qj8jSmpzTFeVrMXpqtK92SProMl/y9rv9B0u5eGhY8edSefyouUL+/5insAU9BoEEYFkB9QdHvb07fUNGdJJ9Wz9UtJ2Ibxb8Re31ffrkO4FISNhAcD2h1KD37CrGk72SOUtxjtq3PqQEe3U/IA5Q0v/xPbXN2LiDP4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744984374; c=relaxed/simple;
	bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKJd3n6tloe7OA27kjuv5KCdVLn6O7bCMAWWqYGdLggPKZwZ5DuoKwE86pn3D+Iec6lJJZanoP/3xqs6Y3rKTywV67stex6DKmSV33tsWBAreSjlf6ujy8a+jtjGMMnhdYaUv4qDM7YRYVOZocobeEJguqBGyPLKhKD98nLCK6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuTxMRv7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuTxMRv7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e61a18c05aso283673a12.1
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984371; x=1745589171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
        b=cuTxMRv7k2Cw9vW5K4XRl/AM1d7FMgEcckx4P0SGoFbsyeTXdNZWSxyOUuEByIpfsP
         5AIOKAhKrJ07SiAT/XgrpqODgHg1EXI2USrY/NJoCpcFGg8jkCb3gm2CGvkIOSSoK247
         7mPbYUc9CA2xwKqbvgEsVO1N1+OXGDU9pHTNBjnaT3ZFrqpYiPzqkRJ/1wz7L0dhPgez
         TxXN658/EGcdbrkFrNaAtSBKQiUOT7WVydsiZyADuu7IdS+Dhrf8rsoBGeDNyGb502bN
         OT5Om7LRn15/DQOXGqWq9W5TinSYDCGjsY/H1FRoKjlZ3xTdwN9/Kx8lYWpr4Z+j4JPt
         fFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984371; x=1745589171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
        b=FWGRwg1SC54wgWuAtK5iwz6Ywwm30+PPu3n3RA+KrefqJCm7DXxjDB7zMufkSIXIpr
         S/hpO9icLNxJIxVwccjHb0qeiOYodPm7CnLBDIxWEzJXcJhihp1acbD1YyTiO2xOquRu
         zFoTL1KMEmhQMLwOVIODcpUuwRBankY4VdHUidkkkp36KqU0q12rdxhc3dLlewh+xMw6
         TUzCEc4BhzrFwo64Vh6AxoVMU/Y5BqooQ3LERYNVh/9RQZ22FUy8YlI0mYlWw0RHn9ij
         RcIXxgako9Z5NNLR3FQkLpqWQBTkrdYB1eOreMvpZr/Mm4Y+JCRW9XTbQqstVFuuLzlN
         2PIA==
X-Forwarded-Encrypted: i=1; AJvYcCVt2xYh3vC8szZzzaL9/se0PT5FwSXatofHIZt15HAIJoJg5EOrHNWpwqJaHtAdx5g4I/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YygbsYZYlXCZq/8y896WUDpP4P1lu4XUux82HP57wcujgVMDZcA
	d6yxkCYm4bh/amaIwBhsUi/MQLHc2cK5MJ+bn8qMNvv57bav2C16
X-Gm-Gg: ASbGncsm7rmyDZBhxKGkDQ3DSehc16IIJTaQu0Zp7QvkLfoh76V5aAmA/0GEfnDuwmR
	Q5LjwHCOJfBcqLCUMyfk3qX/+SgN1msJgM37kqY92jC16V47QU0GpMCF7um3B2cRhQ7Bg86hMAy
	GUZ7ShyJQxspu7IanMYZDXtay/ghBarb4VtENsY1PcsScVpNtbiDOLWOU0YnlWaxcgcOSglOhnD
	zLMFNh206CpTDnYh3Ieu3LRY8lGQ2Rf9Z5ds4P2zcKElSsRfnY9Rw7EllahyYzCa/wbXwiyUrnt
	ESvsPJwQwIe60amrmSTZbGsPn20g
X-Google-Smtp-Source: AGHT+IFVtlQMaZys0yRiOygdgzqKHFtvYUnzaYsTx8NK1/CznrSsNWU+sPquLkREls3wzbKnT9aYMw==
X-Received: by 2002:a17:907:7f0d:b0:acb:583:c63a with SMTP id a640c23a62f3a-acb74dd060cmr67927566b.15.1744984371062;
        Fri, 18 Apr 2025 06:52:51 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0bedbsm124885266b.16.2025.04.18.06.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:52:50 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:52:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250418135247.kf3syqrv3lznmcbf@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250418132511.azibvntwzh6odqvx@skbuf>
 <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Fri, Apr 18, 2025 at 01:49:25PM +0000, Wei Fang wrote:
> Do we need to retain cbdr_size in struct ntmp_user? Or just remove it in
> next version?

It seems redundant with cbdr->bd_num, so yes, please remove it.
