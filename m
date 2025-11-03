Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540402BE035
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155377; cv=none; b=B7FP4QrztP2IY4sfksDlmUgx7E1bWjuvZwE/XJT1PwqD1yGnAOGGvIC47nhXxG7QnhE6o8f1n2Z4yK8oKqztDohyd0ODITqrf+r9/Q52QJUWDB7PHSrCd7L7GO8LtgzWsvicZi9gyFyez/jJGSNXoFdW98dZ3MCEg2IW28BVxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155377; c=relaxed/simple;
	bh=KImMfOPBHJxMvj6GnbGXjOLE3ksMhUz7hd07AjPOnlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNkJ09jNzW1nlHznwQ+I7hLU7AHLunw6tQ+V8LRoTjIoHdqcQ/ICOxUP0EhOSEpg6cVwiePp6MSs+wxYATztCXFQoXDfnld4BlBNYOaFAD/sJLkhpYmvx8oQUHX0qDlufP8eui3IEB0l1cbLla+wBUlzjb0OFxp/Ze4sOB/BfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6tj9757; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6tj9757"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c2f6a580so2103338f8f.1
        for <imx@lists.linux.dev>; Sun, 02 Nov 2025 23:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762155373; x=1762760173; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xy242WDGUqoE91x1eR+As3xqC/KmA/wU0RO3gRLGjUI=;
        b=G6tj9757ZaQoUE7kb9zt+gZdhXUOsxvfnEmhn/iiNbfPw/YCnyjq2UjpoZ8ApNpUfW
         iBP0s+ErPORb3DteFgnvJQtMzbo0A6riLKsFZjLavrmaSGdEViyCFUzn6bzdQcP0K1Y9
         1brtTfg3LCNj8m/A51xeTiVbsiAA9xgIMBlYFV5VPBXT2BIkkGJOhhjHh1d+aiQnzoQF
         TKyHa3svtstiIVCeMX3dmHeMVw0LY8NdNsh4iTx4KF4HfFpmQAdCiwPm2gK0ZFcboFug
         51FucI8B6O+x4zC269cyHz9Oi5E2TWoEzttcAZqTAA0Tvgr4sGDQktUNqD0FalWYsb7f
         7m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155373; x=1762760173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy242WDGUqoE91x1eR+As3xqC/KmA/wU0RO3gRLGjUI=;
        b=kMD2dn9rihMxpq4cE8N2l2u5S0s+cKecujOf+yGvydf7zhUjA4lDcZXu0AmRgcnKvg
         QaS00RB6s8quTSiI0Gk19Ep2mAZmB1cXwQI1MSxPMU1VwUEgOz8hd9LsXe0VwieTxeBB
         qsnXWkzIh3wGFdS1b11zwZ1DWt4lpT3Z9vPNP3U3Z79Yqo/v5Hf7vEj519geNPbbEzAm
         MSNV8IZCBVCZ79bznC7bQa3zP++z+R8riXfof6MKoalWr/8vdl1WNVE07auUkv3upL28
         K+qwZgTOE6Fq2Vut6xY3WhKCi4vr1xAGn39stpNp0AfBMSjJyzjOr4Puu38FT/eZ8LSB
         eTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6XzmrJ+oqsTpy4oMtUZzDqb2J6KjwUZe0Jq8zvWkyeZ53L9ORLIIa6RGDnhFh07RmUgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQLKLtR9TRRnZSS6kFTCFzCxuQo1AhhoSjmzYNNFfSeaMhYv1q
	g3tQYcV6yVd9KS7KtlZa2TAh6L5tZwZAGbbqnxx/cixEAjhS5f2VF3mU
X-Gm-Gg: ASbGncvRSLDJnGSoJvCaH91+KdZGSypNFjRvEouSJZ1gtzrludJO2xVn9ZkO3iwPXqd
	LxurWvCI8pNP+qq/7YHRGxrsG1qim2p5uv0Sns91EyAuZhxOpGyRFzQh8sjofC/a+VxsApXfv+e
	29phJOngxTIElhcLAJGSDXjP6tjxSut1oKoYBACMgEV6tOAJlE4y37UC4Y8g2Ojhce+rOsrfaV8
	hEOJ2UckRay8ITz9gxC+Vb3n2YkawOQLaI5DOunXludpBngQoY22Fo6DodXV6aG9EpOy3eoNxlU
	Ad93BbwMGG7364wIdaNTmNItviNC/n4F3jv1wkhmy4VSrK/7cTFTV8AHziUqq/NBUpY644iKbQo
	uXJroeLTHSeGV+LFvP+O+hU73oxGQjHuY6zV+Ql+S1LudZo4cMiSeSJMGGR5ZMcSqHk0iRBCJPH
	UttYxJiiK2VyjzuHAA4euia8M/N/5M53hMH7+0mkdhAwTh2ZhFEEzqpmmPBgXlxeCMCnNsS0dW0
	lALdGCQngwXfN7FWwfuH1kNkuOFqFo/h01sQaAHLMMZdVKvABiuTQ==
X-Google-Smtp-Source: AGHT+IGVnLrE9OIWhpiHYyEFkXyZRArW2hWys6rXTWz6yN6lGED8eruKLvg3nkjVzrRE8Fc1QB6LXA==
X-Received: by 2002:a5d:5d89:0:b0:429:8a71:d57 with SMTP id ffacd0b85a97d-429bd688474mr9767699f8f.27.1762155373261;
        Sun, 02 Nov 2025 23:36:13 -0800 (PST)
Received: from ?IPV6:2003:ea:8f0d:b700:d90a:9c99:d3d5:33f3? (p200300ea8f0db700d90a9c99d3d533f3.dip0.t-ipconnect.de. [2003:ea:8f0d:b700:d90a:9c99:d3d5:33f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429d1061e42sm6679455f8f.37.2025.11.02.23.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 23:36:12 -0800 (PST)
Message-ID: <fe2e1f1f-3d34-441b-ab97-cb39c10225a9@gmail.com>
Date: Mon, 3 Nov 2025 08:36:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
 <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/3/2025 4:15 AM, Greg Ungerer wrote:
> Hi Heiner,
> 
> On 31/10/25 07:42, Heiner Kallweit wrote:
>> In case of coldfire/5272 a fixed phy is used, which so far is created
>> by platform code, using fixed_phy_add(). This function has a number of
>> problems, therefore create a potentially needed fixed phy here, using
>> fixed_phy_register_100fd.
>>
>> Note 1: This includes a small functional change, as coldfire/5272
>> created a fixed phy in half-duplex mode. Likely this was by mistake,
>> because the fec MAC is 100FD-capable, and connection is to a switch.
>>
>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>> only be 0 or 1.
>>
>> Due to lack of hardware, this is compile-tested only.
> 
> I did not get net-next and try this all out, but it doesn't compile when
> applied to 6.18-rc4.
> 
> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/net/ethernet/freescale/Kconfig    |  1 +
>>   drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
>>   2 files changed, 27 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
>> index bbef47c34..e2a591cf9 100644
>> --- a/drivers/net/ethernet/freescale/Kconfig
>> +++ b/drivers/net/ethernet/freescale/Kconfig
>> @@ -28,6 +28,7 @@ config FEC
>>       depends on PTP_1588_CLOCK_OPTIONAL
>>       select CRC32
>>       select PHYLIB
>> +    select FIXED_PHY if M5272
> 
> Does it make sense to limit this to 5272 only here?
> I get that this most closely keeps functionality same as before.
> 
On DT-based systems FIXED_PHY is selected by OF_MDIO.
For non-DT systems I limited this to M5272, because it provides the
same functionality as before, and reduces object code size a little
on other platforms due to using fixed_phy function stubs.

> Regards
> Greg
> 
> 
> 
>>       select PAGE_POOL
>>       imply PAGE_POOL_STATS
>>       imply NET_SELFTESTS
>> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
>> index c60ed8bac..0b71e4c15 100644
>> --- a/drivers/net/ethernet/freescale/fec_main.c
>> +++ b/drivers/net/ethernet/freescale/fec_main.c
>> @@ -52,6 +52,7 @@
>>   #include <linux/of_net.h>
>>   #include <linux/phy.h>
>>   #include <linux/pinctrl/consumer.h>
>> +#include <linux/phy_fixed.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/prefetch.h>
>> @@ -2476,11 +2477,8 @@ static int fec_enet_parse_rgmii_delay(struct fec_enet_private *fep,
>>   static int fec_enet_mii_probe(struct net_device *ndev)
>>   {
>>       struct fec_enet_private *fep = netdev_priv(ndev);
>> -    struct phy_device *phy_dev = NULL;
>> -    char mdio_bus_id[MII_BUS_ID_SIZE];
>> -    char phy_name[MII_BUS_ID_SIZE + 3];
>> -    int phy_id;
>> -    int dev_id = fep->dev_id;
>> +    struct phy_device *phy_dev;
>> +    int ret;
>>         if (fep->phy_node) {
>>           phy_dev = of_phy_connect(ndev, fep->phy_node,
>> @@ -2492,30 +2490,28 @@ static int fec_enet_mii_probe(struct net_device *ndev)
>>           }
>>       } else {
>>           /* check for attached phy */
>> -        for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
>> -            if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
>> -                continue;
>> -            if (dev_id--)
>> -                continue;
>> -            strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
>> -            break;
>> -        }
>> +        phy_dev = phy_find_first(fep->mii_bus);
>> +        if (fep->dev_id && phy_dev)
>> +            phy_dev = phy_find_next(fep->mii_bus, phy_dev);
>>   -        if (phy_id >= PHY_MAX_ADDR) {
>> +        if (!phy_dev) {
>>               netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
>> -            strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
>> -            phy_id = 0;
>> +            phy_dev = fixed_phy_register_100fd();
>> +            if (IS_ERR(phy_dev)) {
>> +                netdev_err(ndev, "could not register fixed PHY\n");
>> +                return PTR_ERR(phy_dev);
>> +            }
>>           }
>>   -        snprintf(phy_name, sizeof(phy_name),
>> -             PHY_ID_FMT, mdio_bus_id, phy_id);
>> -        phy_dev = phy_connect(ndev, phy_name, &fec_enet_adjust_link,
>> -                      fep->phy_interface);
>> -    }
>> +        ret = phy_connect_direct(ndev, phy_dev, &fec_enet_adjust_link,
>> +                     fep->phy_interface);
>> +        if (ret) {
>> +            if (phy_is_pseudo_fixed_link(phy_dev))
>> +                fixed_phy_unregister(phy_dev);
>> +            netdev_err(ndev, "could not attach to PHY\n");
>> +            return ret;
>> +        }
>>   -    if (IS_ERR(phy_dev)) {
>> -        netdev_err(ndev, "could not attach to PHY\n");
>> -        return PTR_ERR(phy_dev);
>>       }
>>         /* mask with MAC supported features */
>> @@ -3622,8 +3618,9 @@ static int
>>   fec_enet_close(struct net_device *ndev)
>>   {
>>       struct fec_enet_private *fep = netdev_priv(ndev);
>> +    struct phy_device *phy_dev = ndev->phydev;
>>   -    phy_stop(ndev->phydev);
>> +    phy_stop(phy_dev);
>>         if (netif_device_present(ndev)) {
>>           napi_disable(&fep->napi);
>> @@ -3631,7 +3628,10 @@ fec_enet_close(struct net_device *ndev)
>>           fec_stop(ndev);
>>       }
>>   -    phy_disconnect(ndev->phydev);
>> +    phy_disconnect(phy_dev);
>> +
>> +    if (!fep->phy_node && phy_is_pseudo_fixed_link(phy_dev))
>> +        fixed_phy_unregister(phy_dev);
>>         if (fep->quirks & FEC_QUIRK_ERR006687)
>>           imx6q_cpuidle_fec_irqs_unused();
> 

