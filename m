Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1921C9ED8
	for <imx@lists.linux.dev>; Tue, 19 Nov 2024 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732016677; cv=none; b=hgnneiwjcGtuDvh7slAucCCslm8PAZkW1rzs2iuvTrGiZIdhAvPVV7TyaL925Bkaf5tHNCKGmdhhyKzQihpLDR+JkUrHv3lV2EX5itv7ncKYumClhE+lKzDfRXtj1J/KaJPUM8On8VsQzpJ6EG/6YbHfstr6MsL1cDHVXchy7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732016677; c=relaxed/simple;
	bh=f4tKIcMN7vBtR4ST2FQCV5bl7OuhORHbAKErSqdp4Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot8rNGWgF2sGJKBM9zhYxVXQLEhrohsrR6FT17mMz23fXlCkbM+oGo4EcfTQnnDkeS2d7vQvMucd2xIw93mGZJpK19XhHKiymORie/noE/o1W4nlpstgPDpWMEcsJz3NPPowuFXue3ATM/PJXP5KTy0LpbViT90TolwscFR50M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVriVr61; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVriVr61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732016675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f4tKIcMN7vBtR4ST2FQCV5bl7OuhORHbAKErSqdp4Ok=;
	b=KVriVr61la0F7B8zRGO3Q+N4J751et6cxWxYvhds0d1iHU4vS5/aFdxsA+Xx1HZpvm7I66
	Uqww51A8dr+SGrePA1eMYB/4d6yWtS5kBQ0hluH1anwFqDb5iPdYdBdmUYeusPlUnQDLyZ
	dBJhb0BsvLIVMGv560nF07Js8g3Y2i0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-_8I_bkQfMdOFM3UD2i0SHA-1; Tue, 19 Nov 2024 06:44:32 -0500
X-MC-Unique: _8I_bkQfMdOFM3UD2i0SHA-1
X-Mimecast-MFC-AGG-ID: _8I_bkQfMdOFM3UD2i0SHA
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b1786fe413so98175685a.1
        for <imx@lists.linux.dev>; Tue, 19 Nov 2024 03:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732016671; x=1732621471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4tKIcMN7vBtR4ST2FQCV5bl7OuhORHbAKErSqdp4Ok=;
        b=LJpgqRFdpc4ChbxWCagYJPXcw7tFbjyD9Htve53f9ZYHXZd05f9XjJ0OmQ32JfNAiL
         dVICAZqxIsrf0QXRyrzlNN80UZiuICA2FxweJSVQsgBGeDoHAIRBxy249LOgTrA9c1pY
         7cdmJGG7EEEq+ovCatrsWvfZZ/Z9Iwsi5Vw/zwfJVUuCPcDTCFDF72KCYqP8G8krdR0Q
         cxnTX5cJayxnMl990mT/2BnB3xsDtvmcb/tF1KuYebzqeV1gzWsqyIJpzUHNYVbSqJgw
         vm/hZwznk328VpZDUE0ckLQS96TVTIxn+rnD4/qo6Gx4OvkHmekUEu+j+EVqe8NsYBe1
         oqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB0btFA5T6VZYGF3q626BwAoIcqWtNekzuYjjqZ5ySOnPhCKlATE08rQobvE2FI78lS8A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwK0Ogbwj5q8GuB1kWOLwRWlVbVP/av9OSeP/KpA15QuyQL/D8p
	W/U7XrrFCZ+LEbx/pYdVPjPK1Mkph+CbJPqQqJI9CX4ktQgtMh0L+OFVAnO5z4n1TNuAafpU2uA
	9lPEfVzOUr2S11ohjTqlHewVY08tcdTD3+otYr4KhZ7nRXQmcOQ==
X-Received: by 2002:a05:620a:1a89:b0:7a9:bdd4:b4ea with SMTP id af79cd13be357-7b36229f0c9mr2162369285a.9.1732016671556;
        Tue, 19 Nov 2024 03:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK5+OxRQWXQHKP5IEgPJVLZTHomJ4aAb+TacL2h3S/6VXE1p2FnFeTpNsWz1IQmPlXUYA02w==
X-Received: by 2002:a05:620a:1a89:b0:7a9:bdd4:b4ea with SMTP id af79cd13be357-7b36229f0c9mr2162366785a.9.1732016671249;
        Tue, 19 Nov 2024 03:44:31 -0800 (PST)
Received: from [192.168.1.14] (host-79-55-200-170.retail.telecomitalia.it. [79.55.200.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a8643dcsm84759285a.61.2024.11.19.03.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 03:44:30 -0800 (PST)
Message-ID: <31508271-5087-4d55-a509-13bb7218824f@redhat.com>
Date: Tue, 19 Nov 2024 12:44:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 0/5] Add more feautues for ENETC v4 - round 1
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, frank.li@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20241119082344.2022830-1-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241119082344.2022830-1-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eOhJCwmfWyGEZ1fC5zF2JXHT8gyodXfvF7BWs1iEZDI_1732016671
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/24 09:23, Wei Fang wrote:
> Compared to ENETC v1 (LS1028A), ENETC v4 (i.MX95) adds more features, and
> some features are configured completely differently from v1. In order to
> more fully support ENETC v4, these features will be added through several
> rounds of patch sets. This round adds these features, such as Tx and Rx
> checksum offload, increase maximum chained Tx BD number and Large send
> offload (LSO).

## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new
drivers, features, code refactoring and optimizations. We are currently
accepting bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle


