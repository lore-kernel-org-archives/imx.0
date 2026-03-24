Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F53EB7F0
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352190; cv=none; b=dKT0Ieg01l/1VsQOJ1j22z15naOheoF93/kilmB7EViUiwi4pe7MHzpV8ADyBu5XgC+4wkournb0jJScEzufEvu7XbOFHba2rbJnVN7bRYtTtcYkKbmdYGPwT1kNGmLTqkxqYyTz6I5BknJEduSSrxSW9F0/ZV9KLAHAr2nh9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352190; c=relaxed/simple;
	bh=2Kffmcu2UonHQk0RWdOqW7xMjBFx3T0j76vEm2AHcio=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=We3CGJRtwsz1zDuDPEzpUiSZMweH8SWIqZWWIOjKA24U/ttUn8ScHidXs5EbQDfwQevN12pz6phmKO4lPhPjb2A/dO+wgp+71atg9e4V1pbUnqWLY/ReNMw3YhmCn1hUonR2MdGZGLCS/jCEZF/e6rGkZJG+ywQWNeLO3cKR/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC0XVtg7; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC0XVtg7"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12732e6a123so8341322c88.1
        for <imx@lists.linux.dev>; Tue, 24 Mar 2026 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352189; x=1774956989; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zqrg2lc7oSR41YodgrBHmAdhnpQNxqFkkZK54x5+D5Y=;
        b=NC0XVtg7A8aEwnV76caSH2J5oVz1LZFLJJz1aKm7Mfy/OKc3JTbI/X580QZc7o4Tjm
         7c9ryL3fjoyK0OZw7v2EPHXYWfKQGh09cdgSzWL423P2ZXn6JHh9HpjSFza/9/Adeopw
         nJqO88s3cNebT91cTMAtohZ2X8MxQxqjWgv4aFdmO6Yoll5NbjUDHAWzEMMcVO9o5Xnb
         Voe554IaZ2EXY6zP6B2+NJAtbbzLuJFLuLwWlbnUsTpdYwGof27EVQSZAx9yqjWLJv2y
         NIALi8WM0w9Yd2P+fzTz7zNg1hwXLrKiOEsDnKegXW5sFWxiHc9NK7J+xuHqFAVR2TXi
         xRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352189; x=1774956989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zqrg2lc7oSR41YodgrBHmAdhnpQNxqFkkZK54x5+D5Y=;
        b=mZvm68YGmGuIfLZYYs9UFibvTSnqZOVrh0CmUENM3flgNWh4iu3yC3gsGlsgF/tyNx
         PnBGqX9G3Q6z25erQskYyrINCSeqc0Hl7b//kzvU1RsjOsrZxEERYDyltLWU1NYwBN26
         IaaOrG/1zsJK6F6SLimhHU6LpGYNjQ6mm2vMoTLIt+EKojCQb8MQrbvBh+oudyRPBC9v
         WnPowYRcNStlEb6h6vFP/lcnLCnF3wdPZ6NkOiH4arx3RS+6xjz43HgtkuIMsfcS/4Jw
         9kW2qqvKfGE9hwbn4ADhASJtXGvtYNXYIa6fnYMFyn4EvCoO3KOdBlESDIN/YGOMCCEi
         bmXA==
X-Forwarded-Encrypted: i=1; AJvYcCWzhQ+KKsoM+pcvkZQxNj/g9nfMkoW7b0WBpBgTdkuBOEfWAv6o3UgSKCC6/1XmzOcAr4I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3q8MBv5trXkfUJfRuROnT6KfCe2xpjqLejGNeuazFiEtz5TAD
	aynH87YMscoN3+WoxGi6Tjy3oMH2ZagoKvMrNSQvmbJZ0ipHH6cQcLLJ
X-Gm-Gg: ATEYQzwFDeqGjVz6dHk1mHF8gU/YDBePxzNxl8xCENhOjFwHc0X+nnlPEMEW2asODUH
	LUhET1E+7Gd6qC74IlkNFh2XuWvm6IJzkKcKqmJCeSYFK+kXzsjCmT+cMoioXOgqr7aIsMqmLwJ
	01dzLgp8zTw0cLhbJbGFPAfBtr/9/7KnxC5BFTSDarReT/C3YNDwYg4vuuPCtUNR8Id518hCa1H
	/kFmrUIWPR2/HD29f1N2apEIj8Y8lh15KIRR1vquP7LeKR50hiDgCT3K/ZRRLfVzuyzZQa0PjbQ
	2LxbO9xCHIhLfuXcMMEVqQna0MuyuMX/VPxGHDWh0Y0WsXDEVQqlv3oj2TE0hlpYtPVQicGjGKA
	BkMmrmwYWd8QUkYFD79Ha1AKbtHxHKbHIBoTzeUGF7pDCc1CbUkIf8MDbZ5rR+LRJu9fWXHl4ey
	78yDXX77qUoi8GtCw/VVCFesHd7Pa1z27rZNcqy2JCv1949MaLq7ZvtsRfiAT78rK9KimKyauy
X-Received: by 2002:a05:7022:ec87:b0:11d:f89d:85a0 with SMTP id a92af1059eb24-12a726d9914mr7779152c88.27.1774352188596;
        Tue, 24 Mar 2026 04:36:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a73407854sm11245327c88.8.2026.03.24.04.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:36:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59924bef-4da4-46f2-93bf-2173e3280114@roeck-us.net>
Date: Tue, 24 Mar 2026 04:36:25 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Convert TS-4800 to DT
 schema
To: Eduard Bostina <egbostina@gmail.com>, daniel.baluta@nxp.com,
 simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260323175948.302441-1-egbostina@gmail.com>
 <20260323175948.302441-2-egbostina@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323175948.302441-2-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 10:59, Eduard Bostina wrote:
> Convert the Technologic Systems TS-4800 watchdog timer bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

