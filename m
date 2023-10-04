Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F196219E9
	for <imx@lists.linux.dev>; Wed,  4 Oct 2023 20:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keKPyd8W"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c0ecb9a075so1148935ad.2
        for <imx@lists.linux.dev>; Wed, 04 Oct 2023 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696449608; x=1697054408; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap9v2/olcKGyDJBva73j5fNeLRwk/nHTTkPfYp92Z2w=;
        b=keKPyd8WCyyTPqo1RBYX5UlqpDI2OkZCcAPMkMxvTIUjZUPJtpXitLwugBvcN0Li2L
         eshrFRndf5Z5tTff6KMVS2TjOmihVdu9LRyklcPPgMhhsqT/5Wda7aJOzVUwvKXuLOYJ
         BRD3Urg+218zepH34uxIDNztj6Tr9h347RgMYCy++PYR+IzluEzyCo5n0LV585GNZlyq
         k6Jtv5MSbIHSAEA4PMUpRMOjKmOruyO70UGM8ih3MkwZfQcMFmuFbK3QheAiE1sSWE2j
         Pt0awVzAwiwHCFP296V0sgJHrkDxwMfaF6m4U08tNpnN1WSQCqfASJSfWZyLjBfxHcXA
         vCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696449608; x=1697054408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ap9v2/olcKGyDJBva73j5fNeLRwk/nHTTkPfYp92Z2w=;
        b=LgEdESw6xiTqy05z5oD2q1Cnjo9KtB1/JdL4dgGubn7N54ATX7Hhj8a5c5X1dd6nat
         Xdq+tFf87mHecl5ImqYfjfwiTMpByJQnSDRicFFbw2gJvb6Q14vr05NKerRZKgIpE5ZN
         uh1ybvteQXm4142jC8h9DV2X39+hAmfYgtDlefu215WyqKXMWUzNe3fGLk4dvEGSxXSo
         t5dkE0GVRjo6mDrEBXU5nk6b3ntZCRqwR9lEBjcTvt1Qq2LbK+zFPkykWD4sHUpQKuni
         XK3JkKK5j/kIwYmCIe53e0/ubc8JAvBm/cOge4GZj/Uf4NM+3bGS11pM4ZGJmEgPpx+i
         EmEA==
X-Gm-Message-State: AOJu0YwTvXF6NQbXk37lE9VXUrahdmAeJC9Bfq9VGACQNanh0CqGY2tc
	e/3inB7WTRZcZmeJfXZvLKg=
X-Google-Smtp-Source: AGHT+IHYC4jt43Gfku5aZSNDpR07NTDay27HY62vg6gt6GiG9D1S0+ovBRiEpFsdKaryVQlPB403FA==
X-Received: by 2002:a17:902:db04:b0:1c6:2acc:62f3 with SMTP id m4-20020a170902db0400b001c62acc62f3mr4249797plx.9.1696449607653;
        Wed, 04 Oct 2023 13:00:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d1-20020a170902b70100b001c5de06f13bsm4113787pls.226.2023.10.04.13.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 13:00:07 -0700 (PDT)
Message-ID: <643c55ca-4eca-4dfc-9176-cf46c2504057@gmail.com>
Date: Wed, 4 Oct 2023 13:00:04 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-imx: request high frequency mode
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
 Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/23 12:54, Shenwei Wang wrote:
> Some i.MX SoCs like the i.mx8mq support adjusting the frequency of the
> DDR, AHB, and AXI buses based on system loading. If the dwmac interface
> in the driver does not request a HIGH frequency, it can significantly
> degrade performance when the system switches to a lower frequency to
> conserve power.
> 
> For example, on an i.MX8MQ EVK board, the throughput dropped to around
> 100Mbit/s on a 1Gbit connection:
> 
>      [ ID] Interval           Transfer     Bitrate
>      [  5]   0.00-10.00  sec   117 MBytes  97.9 Mbits/sec
> 
> However, throughput can return to expected levels after its driver requests
> the high frequency mode. Requesting high frequency in the dwmac driver is
> essential to maintain full throughput when the i.MX SoC adjusts bus speeds
> for power savings.
> 
> Signed-off-by: Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Tested-by: Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>

I assume that you cannot go full dynamic and adjust the bus frequency 
based upon the negotiated link speed? There may be a need to adjust the 
bus frequency prior to starting any DMA transfers, otherwise dynamic 
frequency scaling of the bus may cause all sorts of issues?

Regardless of the answer:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

