Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664543;
	b=nI+LrC22U96g4Pc7fT1UPPpBu+dNfhWnq/ytmy9jGIBtathagXeLzbxxASC4Qp+A7VC6
	 iNlaAhIG6tt1dENuRfDmsrLYJ+n7HI6nafsjm8kvWwxnsHfCf/RZm2N2siy0HqUkLua0k
	 VMGkWBw0DINTG4V+Tk0z4WLzYmd8Y+xnkPr8wmH3RLjqsRYpZwvhzRkTCIgmSV9Ivd75X
	 7V3+aAQXuoCJBboLJNWuQt7hQeyCFkBJw/CEBrCbNNpJEw4O9ohDb6tymS1ir0VA26TAF
	 YC8RtaNWPW0d9seshz3aPeTBAq0AfxwFbwxCKWAXkowB8jltMAJPnTQWWGA0j4TpXnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X1hkH/WoS1PUodSVVDSJVTIP1ucGICUHF3hWVbzAKEQ=;
	b=K7FwN1cpOipGv8yQE+VonEy+J32KQ8fWglAMQomUrc05OLY59U7ee7Sud9sw0SJqdFaY
	 FaTZ4rrnI0XDn1fUd28viHVidXrajpkl8f2ObsHnpwr3nKPgzo+pW0JdHlc1YhOjSQNbf
	 IDBW0GCb+tx54WAtNegzEk8OYxS7G0lgAM9NfWy6d8ZhVNQwue+MSxnYSwRCZNLVSCdD7
	 XjVequIIbaAfcskx5QAPw+J6cPdIHkKnDvR6/Iivm0iyUmepHSHQ/xFnKCH+r6b2lPuFt
	 Iguzrgz/dgTbfek1NUXkyUZKqDJbJX6NukPj0Y3lM3qRr0fqvFtgf7kzJ/94ogxWQ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YBM8aN9r;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18404606A321
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 10:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18404606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YBM8aN9r
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so11594465e9.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664541; x=1793269341; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1hkH/WoS1PUodSVVDSJVTIP1ucGICUHF3hWVbzAKEQ=;
        b=YBM8aN9rJTcxBoBMt5GkSu0kL1m2C8vOYr1CMY9UIfNfR6iw7TZ/LemTveTgiQQfaS
         zDMHMAptqinW/jZvz3qx9AhHWc7LRjTYqBOtT8OkSNSMNarVDmsWBgQ2Kn8E5sIYxgCI
         expDucA0SmDlGRXAV6Q2RkrPAx0tidq+shw64mPn9SVeVCYpI8aDfbPg4cqaKroOtcpm
         8emaUu2zdi865Y+Q0HV69Kbaik996LYBx/Z2zUfMZYHMfX5vcET7xzOTLxzjYSmFleni
         x1NR7DV2UYn8NzcB89sG42DhDo2olT/IZ+jg5sPvnAR7aitTVkBrzkoq1pSOg9PaeT5T
         /DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664541; x=1793269341;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1hkH/WoS1PUodSVVDSJVTIP1ucGICUHF3hWVbzAKEQ=;
        b=rGlQZmMGuRW473FF82jNYxoCI1XZwoH996IFSL60+HgPxXilhIjEmG5DLDWzHpPmnx
         iAVhHEV/8VxjbNhhA6v4T2yvDVRm0LgqPjN6RAvHDAteTqQgLjwNz6Rjl/5Yc2DHUyTs
         zU1r3eBSo2Wsdx6oaE5q/FZb94ak2K7Mu2e/t3Hh9eM1ziqifR2Vzz/kfd77mgFY6+xQ
         BP6eYUnTcN+vH9gH24r5xgswNL2N9YHBNQB8365AW4nlrI75pW3gc2/KlgyhCYmADYAL
         9WgGs7iqBn9CHdfzTZk432rxMWqQQtGAyOdaySFCVEbqLhen3+WUXFyO5o0Zdo+7icq3
         AsvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnywTMNI+LsTEhhCIRNAxCoG63q27TEqLc7V8uGrg4ZQMZ9Ca+6D/4Qa/DT/ebhISTLWY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKRQXdBDpMeSw9IV7X3XXz4TJRXYoQ2YRea5ZCwIaKUiomqS6F5
	CC9YZ4d1kyzuR1X1jFQ/oS51myNWTJp+54o7S2ZlGjRurjmY3uND5EFa
X-Gm-Gg: AYBFou2EGDtRU/5XRDxinQIFpYjFGwLEkVPCTEGb5p4Cuko0LyXyhBxGzfdwDaoyJI3
	gATvX+G77F+mAllUGSX3y9CuY0r6ZagfZcdv637BNKLW3A30uY4pyWmZeOYA2KyIhtcLdM9bJUR
	s1q4JQ+3V7YrHhP9ReP/LWSh6EQ/Ir49w/X6IqcrfC7JxYP/+GngYDzWrgNxkcuqjTl6IgDGdkI
	M4As++KL+jimhSIwRte9PquvCUD6sGZdGutZ0DGAbkMGanJbt+pNEo0PybWru6kOHZeK1cxaoRj
	6qz+3DtrfvaaIWvXH/qRW7tL5qeFobi3lDELcHM1LKWQ9Tx95XrHNbk05LKVAtccs4md/0gxmsn
	A6p4LsPPqZAQbmFjmYRuv5VQszUzhwJQ1vVFLQ1yZ1tplFkr/Liq07G2OzKUpo2I/87HrTITirh
	i+LNzT/WNNHyd9iSrnABhbC4DXaq/oaf2IXLhREvyZhLaHmxgyL+2raEs6Zfv9cJCusaC84KGPC
	4ArGrKYEPH9W9KJhNDqLwySSRIPHQtzaXtpdU+aDkDHiBnN5RzwQu1/+GdBK8SZnziWviHX4c3I
	VSy+pOh6+sTTik9vtg==
X-Received: by 2002:a05:600c:3e85:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4a1fdd575ffmr96476065e9.29.1792664541152;
        Thu, 22 Oct 2026 03:22:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b37df4sm60298495e9.6.2026.10.22.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:22:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:22:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Zefir
 Kurtisi <zefir.kurtisi@westermo.com>, Zefir Kurtisi
 <zefir.kurtisi@gmail.com>, netdev@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 2/4] net: enetc: do not rely on mEMAC hardware
 frame padding
Message-ID: <20261022112218.11a1faa8@pumpkin>
In-Reply-To: <euqz7djxfn4tqbd63ymcj2bnu7k2bb6hzlmeilao3rvjdhyisf@bk3wj5hinfnr>
References: <20261021145314.1435049-1-vladimir.oltean@nxp.com>
	<20261021145314.1435049-3-vladimir.oltean@nxp.com>
	<20261022093359.723c7e93@pumpkin>
	<euqz7djxfn4tqbd63ymcj2bnu7k2bb6hzlmeilao3rvjdhyisf@bk3wj5hinfnr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 12:41:49 +0300
Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Thu, Oct 22, 2026 at 09:33:59AM +0100, David Laight wrote:
> > On Wed, 21 Oct 2026 17:53:12 +0300
> > vladimir.oltean@nxp.com wrote:
> >   
> > > The driver sets the ENETC_PM0_CMD_TXP bit to pad short buffers.
> > > This works, however sending short frames from user space and looking at
> > > the padding bytes inserted by the MAC at the link partner, we notice on
> > > LS1028A that the first octet of padding is sometimes not 0.
> > > 
> > > This is fine per 802.3, which does not require that the padding is zero.
> > > 
> > > However, there is an unproven suspicion that the padding bytes may
> > > come from internal memories, and unfortunately I couldn't get sufficient
> > > priority for this octet's origin to be investigated by hardware
> > > engineers.
> > > 
> > > To be defensive and not leak any sensitive information from the SoC,
> > > let's pad all frames to ETH_ZLEN in software, so that the MAC doesn't
> > > have to do anything.
> > > 
> > > There are 2 distinct cases to handle, for GSO and non-GSO. For non-GSO
> > > things are trivial; we need to call eth_skb_pad(). For GSO, things are
> > > not simple, because user space may set gso_size to a very small value,
> > > which could make the GSO super-skb smaller than ETH_ZLEN;  
> > 
> > That isn't sensible.
> > The minimum frame is 64 bytes (including FCS), subtract that, the MAC
> > header (14 bytes), minimum IP header (20), minimum TCP (20) and that
> > leaves 6 bytes for user data.
> > I doubt it is sensible to do GSO for anything under the minimum mtu
> > (128 bytes rings a bell somewhere).  
> 
> My fault for not being clear and inviting this kind of objection.
> 
> Since we do GSO in software, we advertise NETIF_F_GSO_UDP_L4 too, and
> there, Sashiko came on v3 with the observation that for UDP GSO, user
> space can set gso_size to a small value using setsockopt(UDP_SEGMENT):
> https://lore.kernel.org/netdev/178960175550.22033.10648880872141935672@kernel.org/

I'd fix that in the setsockopt code.
But that might be a bug anyway.
UDP segmentation has to use IP fragmentation and that is usually done because
the interface/path mtu is too short.
But there is a minimum mtu for IPv4 of (something like) 128 bytes, and
it may be invalid to fragment into smaller pieces.

> Sensible or not, it is possible, and I did generate a test program using
> an LLM to confirm this.
> 
> Regardless of that, the last segment of a GSO super-skb would need
> padding anyway, because even with a 'normal' TCP MSS, the skb->len
> modulo gso_size could still result in a last frame < ETH_ZLEN. Padding
> just the GSO super-skb, as I did in v3, would also not fix this.

True, but that is a different check to the one you did.

> > But does this code allow for the VLAN tag that you forgot about in the
> > other patch?  
> 
> Not sure I understand your concern here? Is it that with VLAN TX
> insertion offload, we pad "too much" (i.e. to ETH_ZLEN, then the NIC
> pushes an extra VLAN_HLEN)? I'm not sure that's a problem..

That is a problem, VLAN packets should only be padded to 64 bytes
including the VLAN header and CRC.
However such overlong packets are likely to be tolerated because
an ethernet switch can add a VLAN header before forwarding a packet
and it can't know whether a short packet is padded.

> Anyway, with VLAN TX offload, the VLAN tag is not part of the frm_len.
> It's part of the extension BD that we forgot to account for, when
> determining whether the TX BD ring has enough space for the frame under
> transmission.

That is what I was thinking of.
By brain thought it was a normal BD - so would be in the 15 limit.

David

> > I also noticed that the code seems to dma map the fragments for each
> > gso segment separately, just mapping each skb fragment would be better.
> > (But that is for another patch series.)   
> 
> Noted, I can look into this separately.
> 
> Thanks for the review!

