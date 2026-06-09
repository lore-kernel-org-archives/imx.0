Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23E3F075B
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995583; cv=none; b=K21jm/WGYqqkYF/AcudTyB75aNbd+OHPoLJCmmd0DD5LPpeMZ9esUD6v7QwH6rxkML31EKXVdgsd28U4+RmyrEpkHqtzG6QoFZo3Vvlry/T3ZDMhyyO1BOa4T7Lsb+ljM12QSwEpKgI3vqxGO0NjlPX+HQbSWXX4I2TUBsZavGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995583; c=relaxed/simple;
	bh=f5S+i3RVl0cUqmWNDjtmc/b/yyrLqBrgrSpRPlEOqsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uociqh44KNU6SNwEK6qYie73YjMmivtvyFatwm4jo0x9VcwN3R0B63kSz1GWv9ZS1LwTuM/BWLkWM75sp//L1eJJPYv19g6RiDXyENXi7PaZuwd++yplX3HwYJcFOTxZIoMVPaihfg5MenFAGfuaGShfMAFoHad3+T12RdheDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FoU2a38l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FoU2a38l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780995581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
	b=FoU2a38lJcL+uRzIBCzKpXpDGFmXs3dYTyND3fT/HHsakKyRDulzVKDseFNOAZmw7fQ/sM
	25tjuQkN6/ZJagigM/3ZqIWsPSVX9gq468b7evnSkv+RK8ywAgYNELjH0HtHWzsvgSd/QF
	QmIdbyNMQ1wPHr5FgHb+CR1IJG8SHcI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-EZSaEZ-zOt6pj6FnbkZySg-1; Tue, 09 Jun 2026 04:59:37 -0400
X-MC-Unique: EZSaEZ-zOt6pj6FnbkZySg-1
X-Mimecast-MFC-AGG-ID: EZSaEZ-zOt6pj6FnbkZySg_1780995576
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490b5d2e394so38186765e9.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995576; x=1781600376;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
        b=kOsy7odpaax84fDyvlLHSZc/aa2haNVqUFkB/V3ksTLUoVZAAaqjCWGELEpSxf+/uc
         8xIepIKhRJ/mA8SxS0zThXHMa7cVbUtA7ZyNM1JsneXrUvnXvHjDEstcqDGEd8QrSVOK
         ZPlXh24mN9w2JqolVwxupPIrcYai3ofFsm+SQzMHXS1SFoQ/cAyBPiZBtfN3Nx5Q02Su
         D7YXX+PMR/VF9pzXAT0It5+uZyKP8RNWTPB8s3FDCx1aCtPHxfUcO3dbsm60MPBKxVAd
         tEYIjN2VUL/L+q5fIfUvg2V9n63rVsy5eoMrDjJZCtLDpWx+j4WCyAihhsLeCWC2bLe8
         DTGw==
X-Gm-Message-State: AOJu0Yy7wLd+0nUdvxSnamYbnFr3B1KvV/H7sPiwV35dewULzELJDyKs
	kIu/uiPY40/08MWLIOHohPKsBuDi3y4VoBH91d7+/y3XsJesmrRFaXoum+n8M8pbZIHE4q6hZ17
	mrC0QChjoA1RMjW+QLLPS6gCXhh0AplsWzPV7a3tUFpIsypsFB54Tng==
X-Gm-Gg: Acq92OEKsNVy3DfLl3xnAEW+PbK3hHV5CasKOaMpUyvQ4vnjRdBCLwFW0Xoui/pf0B+
	hoXXzuEHYngnHk/xMrGdYGTH/CIUNAq/vhKriDcWkY74gHsrrxHlr6L2YwKUH6FvC0oMs7Bv1Iw
	++sfK2tFyQ3xny394tbHZIFZbpKtgn5kMTiUXmroeoAyak2VdQw5m995qhgMbOdup8t9bERXgRX
	hFPmlmbVWRHXxlPr0/TTQoQ38YNWAOopsD/ib/mU5lmDtuCm9g9rNFjokKPxNxXBYZA96fUnu4F
	J3kiFpNSEcAbqRvpQfiIYkOj4N27Ag1n1cpUHcvnj1jWAlZt3GhwiY2SYGgsQ7uNQDe7jDA4Q02
	6WudWJZgFHTmMkTqkqhe+aUrq2erFrdO1Qo9z6aTOrArctQZJiWUnxK+n1sovff6Pcw==
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr315117495e9.6.1780995575666;
        Tue, 09 Jun 2026 01:59:35 -0700 (PDT)
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr315116965e9.6.1780995575267;
        Tue, 09 Jun 2026 01:59:35 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d6c65sm455288105e9.12.2026.06.09.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:59:34 -0700 (PDT)
Message-ID: <4e2fb478-1d37-47b7-9bb9-3553d5ca2fee@redhat.com>
Date: Tue, 9 Jun 2026 10:59:32 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: net: dsa: Convert lan9303.txt to yaml
 format
To: Frank.Li@oss.nxp.com, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6MV67PW9nrFgPRYxSJzhvPCqisAtiR-wREeGjqeJQMg_1780995576
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/26 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert lan9303.txt to yaml format to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx53-kp-hsc.dtb: /soc/bus@50000000/i2c@53fec000/switch@a: failed to match any schema with compatible: ['smsc,lan9303-i2c']
> 
> Additional changes:
>   - rename switch-phy to switch in example.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Does not apply to net-next cleanly anymore. Please rebase and resend.
While at it, please additionally add the target tree in the subj prefix.

Thanks,

Paolo

