Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816304;
	b=r0Us8W7adgSzloWzoWixq8Uzzw/ROna9D87lNvr3xPbLbItt5Vuy8FjLVVLnCfeivrjr
	 UYbwVD8TwdZ2RkQH51bzxhsKPfkSnTFjYInzLFW9cu+OAyLj4sj5r5B4vui1NmXqF5tpc
	 yYSX69Oee6sbYeIj8+5lBxJTtC9SMXoc/MhZq2NBwB4pTPue/Zp87Lkg42CcU2j0koFNw
	 NYFeeJ4EJe5RFOiBq4c0WFWl4hcpTEVsEyxI/7lBOhy/rB3x4ceLIKDnVWLE1uXqhuI1e
	 KgUNJEbTvkfD8XimBm9PbKW+G9VDQpPf/NxhwgTwXOaSB74Bn5+9bg3U1nwM834MEIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816304;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=sMF+DuUShxHT93jwpB/tWUFXCy+FZ5GF579riWa0i/s=;
	b=Y1Z2069MLbHdgeL9kM44YwPOb4Le0yosQzIqYGSU7pgXYsp0CgKCDwbTBxtvyFCnGxVa
	 8VzT20Ot9zo5eg1LSQnSzuOis6B9hN5Q/rk+RiMgmRdBWy9NihT57PkBWtplo87JB2wWj
	 R1e8Y5/ufumv+lsi8s0Q+NxF0NUgBJrS18xUwzNRxphnmxsCIEZzPDT/QuM0Za0XRNPAo
	 alQLQF3Y46XpCVQHZQCU0pWAdav/rcuY5epLpSGp4CunfVmOFJSuVPrBrY2NOa1adWul5
	 goZMvZMGwy3YrT3pnl6IbveZIKlsiOOgm/Fki6poUMAxUyZs+pWie8M2w4mTcuMcD3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=esz0q84h;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB656606A32E
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 18:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB656606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=esz0q84h
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93f269e335eso113849285a.3
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 10:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816303; x=1794421103;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sMF+DuUShxHT93jwpB/tWUFXCy+FZ5GF579riWa0i/s=;
        b=Z+dDybDD7H0LmqYNh4rbhMYyFE5yonsMI0vytm4C0u420c69PvTTFq1l9NR0srHCzV
         flzbhW+RBZBF3gcjxJc0cWDZavyj65qcxkmz3KCs4+ZiarBD0AhgF/EnrCBxWjhB2xL8
         ZKqPkSM5AnXjPXZd06qqgtW5Gh1I1cKu7mrZmq0t69uMgavpVvEneZBZFin6A+t/nBgv
         z+3w3pCY06oby3XTWsZffhk9isCIRPhYRkjCHGCYkljLwTuqUmU6Uz2VqAkMQBMapQr9
         AkUY8uyqHFF3GhsyjHC/Mayqhlt1CMYzc6E6MiONc7MVV0jNrYBZ4ENp2rjlVwOklQfS
         Rs4w==
X-Forwarded-Encrypted: i=1; AKwUvByJSYZv8x8SVEwgY6DpgQzBcroI/RwzqeqxroXOIBQ+C6guxQ5gIDt06DXqkhGiZcI8NdU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+M0ZX9m4v761o038Y6QovH6Z4aSsB4eshM4qPxoXQaoEaYXthR
	xZ/ooEoIDy6SGq+UfGjkjhL85/Z6SteYE2IEsKEIiRp2lgWupeBkaCkFf0y6xmG2kvqFlo2vzmG
	juoMEWK92tW/t9nwQHLvXe4hxZz1MTgCitw1D93qf7CW5Bqi/JJN2rVdcVpTg/ANOxZQEjB4NQ7
	AWdNzlbt/7gJrQEDV9aWzPF7VqgBwztfodeFtcZKtMpxUS7K5/ZnhsU1DLbL10EXrmVe5md7B8v
	g6ZYK/2Un8uxIs=
X-Gm-Gg: AYBFou3z9D2boOZiCz+kAu270v6Etesn4TIZU80yPwa17CanxM7pNRYJBW+7SqEAG17
	e6uRNvrbZKDMN6NAVG6uR+KQABt/NwBSDacONtJPpsItle2ZVTqQ2NzLcb8YP5Cl/5NABPJnGeb
	nWouExKhFfvVPx6JSybuf2tebLlQe7+bwbliU97v4Wd1EEKU6NWXd+ODcuqfvScfzzRuP2gDI/X
	C+n2BYypWzdeveoHuYxLP8gDc/xiCrvfFj9uuHEfESDy4kvEHkkYUF3GxFgNMDceCvVaavGb5Mg
	OUsZyXMHBZ+lo/KrdJQxus7Cm7Sd6R7JPF5uM6cVTgrnrzpUWtyvMNCHWCcHkgFIBXixcMllhet
	NVmiLbMusKhUbiZT8CPOi7AuRUvV9oxgos/Kyo9Xp5OnzFMehQVh6sCkVGRv5jdriXshMmCZfYa
	BleMUM9Ox98lD0zJgi3Fjnkc1WHaa+MIHfoj/rxcSc
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id af79cd13be357-94421695deamr2611116285a.35.1793816302499;
        Wed, 04 Nov 2026 10:18:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-945d468517csm40391785a.2.2026.11.04.10.18.21
        for <imx@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:18:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c85c9a756so23621426d6.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 10:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816301; x=1794421101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMF+DuUShxHT93jwpB/tWUFXCy+FZ5GF579riWa0i/s=;
        b=esz0q84h3HbyeOIWGg+SUJCbSYHeumV1PhRVtGaJR5a95GSTqhjrDMwjKBIz3WepL1
         3WWU/Gz2RZy0lbOYwE1mOts8o9K4xYoiNiHJQFlWbqVCBppyueP+uCyzP1s6J55l91r/
         KQioYxzMC6j2ai7h7dU+XSRaPEKhycOikLfJc=
X-Forwarded-Encrypted: i=1; AKwUvBzL6Xw9AYX2Jx2XW0ijyZjk8A6rqejOygeoL0TjCNKybZvruR0p04q2sEf0eZeaIre4RdY=@lists.linux.dev
X-Received: by 2002:a05:6214:5781:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91e8bab0503mr27359636d6.14.1793816300829;
        Wed, 04 Nov 2026 10:18:20 -0800 (PST)
X-Received: by 2002:a05:6214:5781:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91e8bab0503mr27359016d6.14.1793816300171;
        Wed, 04 Nov 2026 10:18:20 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e8dac2a3esm9677426d6.1.2026.11.04.10.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:18:19 -0800 (PST)
Message-ID: <c5ecea1e-ae30-4df3-8684-39cfb8288127@broadcom.com>
Date: Wed, 4 Nov 2026 10:18:12 -0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mmc: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Aubin Constans <aubin.constans@microchip.com>,
 Ulf Hansson <ulfh@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin
 <shawn.lin@rock-chips.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, John Garry <john.garry@linux.dev>,
 Hemanth Selam <hemanth.selam@gmail.com>, Pengpeng Hou
 <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
 Fan Wu <fanwu01@zju.edu.cn>, Marco Crivellari <marco.crivellari@suse.com>,
 Pan Chuang <panchuang@vivo.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Rakuram Eswaran <rakuram.e96@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..."
 <linux-mmc@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..."
 <imx@lists.linux.dev>,
 "open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>,
 "open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
Cc: vkoul@kernel.org
References: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/2/2026 9:21 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across MMC host drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/mmc/host/atmel-mci.c             | 3 +--
>   drivers/mmc/host/bcm2835.c               | 3 +--

For the above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

