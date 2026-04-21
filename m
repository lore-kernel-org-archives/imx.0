Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C80175A6D
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 20:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802043; cv=none; b=uhNwa5bpOlIPuEf7eUpakHJXZveSODYmFpwbngiP+B9WbCjlTEB4oXnU1xcpOLn7naCf0bQxOW7HL34ZkfnEK/7CwEwjB4T3COBz2u3h5bHpqOtJnvVuCMApMMAjwFz+9y0A0PQpFecmCR5iz+mTU7+PI5Bd/JkBnj8/skTLqBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802043; c=relaxed/simple;
	bh=4nGXNP+FFeyOAfKIybOpKVmX6+Eo9BNgkIzpy4p7zWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E2m5mnAwIjhvI4Hf7hezhWwXbqfhVsahVuApIY1pjU84gc/yUX22lQiop+9SygTuY+Yhl6KF6Nbt3ln86tXkKj4fPLv33hxHB2JshZFhv4S3Vl8ch2d7ZNO7ywn9JkwT8ejB8Pua3pqf4kpH2JkrlmDQiAL3lLggnDZJ0/I1WWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bzp67evS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bzp67evS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776802041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
	b=Bzp67evSAFNdGjXCnc0ONJvN8s/pt0NBfXJOXMFKxJ7jBKHVddINxCeo/GYccIcpkz6NZR
	4WX25r+wTcdd6qWCSqMUTZvnKAYoDk5HwqBiZrgw2BuS2C6ZeeGmdGOMi+fz+/6tXrN7fW
	lezp2YQ/Lpt8Ju08GgmEzGnm97bFHD8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-yLSkw-VMPHK8pwHwK6gSDQ-1; Tue, 21 Apr 2026 16:07:19 -0400
X-MC-Unique: yLSkw-VMPHK8pwHwK6gSDQ-1
X-Mimecast-MFC-AGG-ID: yLSkw-VMPHK8pwHwK6gSDQ_1776802039
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca154e2b5so18120486d6.2
        for <imx@lists.linux.dev>; Tue, 21 Apr 2026 13:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802039; x=1777406839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
        b=fnaHNrIyKgBkD5kQ5rjfED1KkXXluQL76ev3sSpyYO719VdxHNCdY5HNvhhnRyJsFx
         fTYs1z6xcc56996D6asXC/0l4HMWO5wN5zOwVc39JxI/kREbTJYCN8ntIYenNxWnrHDm
         7X6Kj8ZrDK3BgKLzg+ZEbK0yEz7ut6RE1xJUwI0Kl2IM6vq7CWSpkDqhmnJXK2MuPEZz
         2vMMw/qXLC5qlvh+m332iKb4G9tcIO1InyfqGQVlLuTP6kOj328hY3mdKaj8OFABYofw
         cK9OlQtpvg2scHR+CG6yNqCMGLPxOi2yBJUoHGgAvZanZEqDJLzrc13Ezm1++Y7CVR0L
         jtbA==
X-Forwarded-Encrypted: i=1; AFNElJ+cBhUMALCObfpL3vjGlZO7rTUAEBZasTpc/vEUdKW/ZY0XyU/VAK+Qs7fWrFiDOLBr4BQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzTUW17rvOpJF+EnvaCrAf+3ULH2qc4/lQhmf6cksHYwwKOOU1
	rmTKpR+A0h7ihUbsYp6TFKPUpA/WErke2iCH0PGhyJf4JNwGHIL+iF1TezOE5VKTKKfuobyN0Ix
	/Gjh7ATm3TlnWAxiS4Jn8K9NFrguc81EqHjl+5O/3HQ8MUW//JVx3Jg==
X-Gm-Gg: AeBDievw0nxGpMn2ZPfCHnXNPn5xsknvKUAulQx8TmzVxSIByjj+5cb8alOwXgFaTz1
	q1RuerlDoqHPoLxGYPDV82o5skQ7uutr2x6wt61ZlWcJNUSp+7Ks65EGmkHGyFynR4iS9CXZWzW
	01ZLpQGuULO6Zh8FpE6aL7Q0mA2H2ybKGZuje4+VE03uhlzbShY34RvkMxvLGViVt1tx08ATvDX
	CSxV73EUbHz2PaVuLoDPeXZumzeobrS7m77mHNvZWm3k+oFUnq8QJ9D/MHXmPm3tT3rUVuHdrML
	Q16Jnb31JE/owHn+6IKbJjjgieXfb7LlwII46t4K/LOgRbR3Eg4h60YBa6ubzhHAfAI8b7yRaWK
	4TJAQJ5N126FAQwxCMnQ9fclVHMoxw8XqB1GNzR6BZQ==
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id 6a1803df08f44-8b0280d0e78mr313218056d6.26.1776802038971;
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id 6a1803df08f44-8b0280d0e78mr313217376d6.26.1776802038427;
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5c4b9sm149503046d6.28.2026.04.21.13.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:07:13 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v11 2/4] arm64: dts: s32: set Ethernet channel irqs
Message-ID: <aefY8WGCuNr4BQG4@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: utkGdpSe1__9Q-otfEVjRnXVK4w5T2Wh-E-ra7rba8A_1776802039
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 09:55:28AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

Tested the new channels on an S32G-VNP-RDB3 while testing patch 4/4.

Tested-by: Jared Kangas <jkangas@redhat.com>

