Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4225221FF29
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969015; cv=none; b=IUc1oXfpuY/8D7be28AI5p+U5fGDFpJtSMKvh/RpxWiAA/YhBOhKLCscZzrmzDXeh+td2e9/NYorQCi1Z5YwO8o4Z/nL952dhuDo2E6yGUCso0hbC8U06yyeq0Wo+xeaUux1oJFa1ufg1OlQ/NsW18bxqWYg5ilQhqVrQOgZ3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969015; c=relaxed/simple;
	bh=J8x/CPUWA0HL/cid4XRRf2yJGc3d9K5BSR2KvtLBWhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/bd73cd3hPam/MxjNg8FYwHx+nufAS027QFho/FMupaKoaQeWfuFhHmZjOlN0xWoaEkeZlCpa719OCFP81R1VDZiRViM1zEikpb13t/jRN4OqfG8R3f3BUKWCAha4BgOwRc1pYRgJSUNm6ItJDnQLyNS25eUrVr/NcqrbCwiLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6LkYvGT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6LkYvGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751969013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YHab4xqAP2Akdg2G04m0t1Le3rHcVZpLaQPZJUOZ1g=;
	b=V6LkYvGTE6pn07RAvUL5Fx1HtVgO77Fgo8kv8Rm78GVrhQ1PwpBMKi7zNb+f6d+Q4WXarM
	01re35gRccT+vnASoZrum+Hqtbxd8pVS7yDNXvU3HRj8DEYah9Zi87uMc9mJ28wfFpvYTx
	loza9DCppkRwI43MvZze3S/NhmdQXco=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-JzMz4djANYOwq38UPlpmog-1; Tue, 08 Jul 2025 06:03:31 -0400
X-MC-Unique: JzMz4djANYOwq38UPlpmog-1
X-Mimecast-MFC-AGG-ID: JzMz4djANYOwq38UPlpmog_1751969011
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so1857280f8f.1
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969010; x=1752573810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YHab4xqAP2Akdg2G04m0t1Le3rHcVZpLaQPZJUOZ1g=;
        b=WMQCbq6LY5YeI/qRyKXkW2n2NyhuEbObgpnNx37weuBzEtQCK5yLaZHPjwveroL83I
         brqwwodmL5BLw5urnRQdjDAX2FCGXcZJOW/zgYnRXc5gFQkjJ0s/bdLuW2DCVrT+YRxl
         jIITSlwU+Fv9K11vHq5OS151SLHxwdskWqbiMPYOI611QVFK7cuS3PbptnRbfrOscT+m
         ecGSp5QBvea/nu7AcK9nA2AgEkMu2C24yF3Fkwwqn5rOPwCHJPS50kjMYrMnOnhzl2M1
         wfJh8yO6VgN609NTWYIKxY+ryvoEpX76EuN2ZjrUMUhtAgxfv8DaFFhfNWdDyaAN0YSi
         fAHg==
X-Forwarded-Encrypted: i=1; AJvYcCVjvPRV1H48zaEvXK4wKMI1h9j32qZf7IRWSFHsLBgnMv1hWqnsDB+BQPXXVp7EWD+UThs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+0YaGk8E17k7bxeqizmRSXxbfVUiPzu+9hYChYtfr0ZQXGiHl
	y9EjxBpy9JSK6cSn1ulvth9AqO4y9xzRD0VIYhB9xtrTqzzFy7aX09aobTB7xK5GeNq4ddkZYAN
	u06DBPPNBko2eTjZAT//YUk/DB51dHRJ4jtx0olSVEZBCc5BHqEMbJQ==
X-Gm-Gg: ASbGncvwwIUxlndmiB9Aw2rSsC0IsVZ3nOS0qYq5g2MkI/lOwClbPNKoBD1hY0bY2gW
	vh7r+mTo37tNaDyKVF2sNJ+HurSftBawbZeH7NRCG8/Ne3IxSdln0VjGpXyxyzq9qCbV9fV1rZ7
	YhmMwYc6OZJpcbezJTFgtakgRWji6o/WYVCPlbgzTYjWN4SGytXVheayW1OMsSo84rDUnK4tzP/
	wFsWPj++ZVJwKqnqKUOpYUzAte6gxxjyCG2siw8hbOJoSoY3UCGkC/VgxWSwOzl9i2geqOdSQvA
	JaEUPGBgqCIdUvZ/RyGQ6CnN4ELiia2kId9lNfnCJqhiIQfYJ0uYAk+dqmf8WIP2uQC5Vg==
X-Received: by 2002:a05:6000:1787:b0:3a4:f72a:b19d with SMTP id ffacd0b85a97d-3b49701198dmr10216081f8f.8.1751969010536;
        Tue, 08 Jul 2025 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1SvwWcO9VGXYTPULjJBC0m6vJeUr2jVKEuOXwryHw29XUGkc++r6gFKLLfQS8l/e7j3Mcpw==
X-Received: by 2002:a05:6000:1787:b0:3a4:f72a:b19d with SMTP id ffacd0b85a97d-3b49701198dmr10216057f8f.8.1751969010016;
        Tue, 08 Jul 2025 03:03:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030ba48sm12695745f8f.13.2025.07.08.03.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:03:29 -0700 (PDT)
Message-ID: <ea22a546-9381-48c3-8bb6-258fdd784ca3@redhat.com>
Date: Tue, 8 Jul 2025 12:03:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v14 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
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
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
References: <20250701114957.2492486-1-lukma@denx.de>
 <20250701114957.2492486-7-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701114957.2492486-7-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sodh-0N4CiKv3BGWL1HaAHhnaxQ6I3UQyNKULWwxUJY_1751969011
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock(&fep->hw_lock);

mtip_start_xmit_port() runs with BH disabled. The above lock variant is
inconsistent with what you use in patch 4. Please be sure to run tests
vs the next iteration with CONFIG_PROVE_LOCKING enabled.

/P

