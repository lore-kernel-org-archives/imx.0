Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80328313D
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772242; cv=none; b=AeQZEDb4+rM0/bS2neiLrm7nn25xhWEt0++Nd6x8LBFQggsVkAQOJMSGUN+VAEgi52qJbjvf541EHGsu9AH3FTHUophQfGiilpIE2ROujTZAkGznxIXEVyD2eFXoFgxrLsQpCmllVuyjsBhgrq5ojnG9UsDWCcR4aqkV20iGZ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772242; c=relaxed/simple;
	bh=w/IDMkNJyCUUzyRjdmPql/8lwhxsnPEA40uW7VzKY3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/K1EWHVUR5x9TiqXrZhDElG2QfKhzOnp1/tBX1t2V1D4UyUXhC6B/bNG9K8jdJN50VL65xsSxGaa81H/NkGNwjGKgo5UJ6H0otudlk25ZFhCSZ46FS2H80EYfagkzI8K3FFr8ZJNTmoAfu4ltvMM0bNC67joa8zOVD21mFXLhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZwLVjHV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZwLVjHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750772239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=;
	b=CZwLVjHVxraU7h8CzE7F4dY+qYxZjBlszzfB2qNF8T7B5NH3cDWAwgmtvgng43I4APshJR
	93obTMNXzv64NccZ/+d1OyhW+NrfDcuyrZtTmzUt1DUluG0H0W1Pm+cg6Fby5rv17qZu5m
	6sOhi5UPy+JTI3voewjoeg1gAGclF+Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-6WCQfMSpPK2cwRVEcfpIxQ-1; Tue, 24 Jun 2025 09:37:17 -0400
X-MC-Unique: 6WCQfMSpPK2cwRVEcfpIxQ-1
X-Mimecast-MFC-AGG-ID: 6WCQfMSpPK2cwRVEcfpIxQ_1750772236
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso35593885e9.2
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 06:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772236; x=1751377036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=;
        b=uBv/d7YssgNHzRopklfqeYipSo7TAxiaOjaTBnDugxe6KZPBkHW1J63brBK5qGx+4i
         znyt2lRGV+Sn4BUVJQNW3oOK0FtQVbDAYN6IlwQR8lPzU3/w9aqMCZgSJ191PZ2ziMFd
         c7OWc4bTnuZIaDY1Nm4jWyMxO2zNVMQbGJCoJ3ICv9C7lTOBUh+ZoauiCHn5aKK5O8sU
         7bLEqC2YCnX3WAqsw0hGsy7TyqZeGIEjWBKuWZm1k5Nn9T+ePWrhOJdbT69vTZijo4HD
         fmOSVZRt5e6cbM6DBEK+pPCD+Ue6cnhUObdB8Vf88TLewyn8ga5YXYtDuwp808ikAiZT
         YfCA==
X-Forwarded-Encrypted: i=1; AJvYcCV/+6OApjoRtZKgSddl1vWNseqmiJT+tCF7cdSerXiQfnchs1qLAL9X2BXouFV6yWvOVhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFky5eT6QgOTMJ9uTVrzyRX4zxCGMzOkE4lB3XTvnOYWOvA01C
	mp3EvADLbT7F17oec5H9FgR6uAsbyz9r/ljTM+Lgn8YZl3yfnMUlovquZfsD+/tQSCo6cZ61o/t
	LFAQtGhwo7k7aKKh1022OmM9hbK7g2ytARS1xJmIzsYN4TUZNb2uiAg==
X-Gm-Gg: ASbGncuKd2RrjVKMH1TN8J2yEAPIW/jry5OAbts8OhcppWG94K98k4QsJo0bdjJC93J
	ncQ04vTrYJ/d0FwlGJbd8uXnDUQ5bzXPzqR3scEMguNcFhWy5wxH0J8zz9bkh3C+fLONNuEox8z
	RqXcEVUYU1D1Pu+CvGl1SjijP3RqosH4pDZ/jxV8w7gmMpFRtZMsG++jF5pbgUOMRdWzi5o793s
	FgPctIxi/CAkRc0cvR1jJYgvbLK0VB9R1RIUTrx8nNH9zXL8HuX0BwLF+Jk3kn5mVnKOkXI2zSx
	B1IBDHbIXhU+vcThQHdQBkTLhJY7gg==
X-Received: by 2002:a05:600c:8b67:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-453659c9b5cmr178056685e9.10.1750772236040;
        Tue, 24 Jun 2025 06:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCDctwjBQaSlAXYgDwmWAr33weRLLnC8b8hgrnzKmiQvzZklRmZK8SJHQ3VS2Chx7RMg6ong==
X-Received: by 2002:a05:600c:8b67:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-453659c9b5cmr178056295e9.10.1750772235622;
        Tue, 24 Jun 2025 06:37:15 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd589sm142741035e9.26.2025.06.24.06.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:37:15 -0700 (PDT)
Message-ID: <17f789c6-cf64-4940-ac7b-0107b7b96031@redhat.com>
Date: Tue, 24 Jun 2025 15:37:08 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -etC50GLM78Mt496EoY9AcXuayjrYPJr-kGrTgs-OvE_1750772236
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> +static void mtip_adjust_link(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev;
> +	int status_change = 0, idx;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

The above kind of lock look incorrect. In later patch you use
spin_lock_bh(), and the context here is never irq.

Should be spin_lock_bh()

/P

