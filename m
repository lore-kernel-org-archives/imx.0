Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB822BE7DD
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867872; cv=none; b=lF93HtlMSX8lQdrzqoa/szvh3UHgpS0jA7/sBiFOVJc5TtbfX93l+vlXU1v6XoRxwrh2HQHkH0pLfUO3PoykHq0W5VQVa0HqZA6u2s/p7JNif7c0rGFcnNDXpp1VHZfiXYmvCxUHqMSdC68ZaJI+JQB/4t6Vl/hDI2COh40BG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867872; c=relaxed/simple;
	bh=Qzxxfb7kEku2747lmzT1fwRiAYJSGvUIx6A0aGIdbAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0qaX1PBSiF2NTnQL3ne/nA4Lh7dN46ec0en2nAKed+9SR6241aqp4iPFVzzN/umD8VQYYpByGtpb2utfQvCyHlMXUH5OrOFyRuLHQ6dr962YfnKEwduvMq1tBWhkoZgupSKgubxwqhO+4UdY/AFX4aSIThpTsdPCq8n+43KBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QL+JtZN1; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QL+JtZN1"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-798527f822cso6335747b3.3
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867870; x=1772472670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=FhcEJu7B14/auW8hcyPN4qCx8ysL5imPJdcb/I3uV3dUDewoIUDkdTfUL9ckJhLKfg
         mdfqIxm0JSRffT5ASv44nsRH7wbqOgWSgzRus54SgCSC8ZoJNnPL0D5LJyyWFguhsMeR
         QasnTSELcgGbfTETrDOHQpha9NjPmuHqi/e0pgekQU2JkrvWbneQnrua9sRPpuZvFhNo
         waiP78wOCNKYZ3zczHCF/VZS2NOIVvKc5n4OMpmTIDkhXiYZD1s1GRxviGFYv3CT9o3H
         7VuQ6lnMx/Ok48AOGCUto+gRReik2BR0BMKN9Yu+NL2Qq+DDOS56aSDf/35GyA/mbxW8
         FtXg==
X-Forwarded-Encrypted: i=1; AJvYcCVZgAf+SmhSNYqsblPRT4QJk7LZYA+EU7wqwaoryl3wyVtBi4P7wdSPLHfuCmlW4Gl3HfI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yztt9JPRs/17GFYkBtujPNHE4+5uQjnUbQXdpB/9e9doT8K7k7Y
	wNjOqswm8ygO2M/2N46ASVtbYi1YP1HFS3yj2TyF6vayqqfAByjdwIwizYbRrs4xI+giZJa/0Nf
	cnW5SL6UsYXfAAqr0pyu/I+9xEh/S2fg1ENjehxjmYC/8LzccrwRc0PEfW0A38i6b/SrWr9a7zd
	5bvlIw5IYsFBW6bJuqDRjQSJXB7ZJQxkuKuqEm2OVaMTG2dt29wfxl8SdcE6xBVCUdiVz/jZl4P
	9y9yjuXscVK
X-Gm-Gg: ATEYQzxTm3nVgPwQBR7kKqrT8mdNuScuF0xC64CILp7W+7fVVS9CR/MJqhIUGtQNQnD
	r45x4K7L6VXE2gOngb5RCbq0HI0+akUmDD1wpB1fmGshkNQ3GJ5oBR9ZcGl07CcG6n1nlXnAvoa
	ytGGMMZUN6HRLZJGgFHMxiwD2gVuGXklrJqHwKk3L8zcVJZ04jzf588L4HF6H0Nl2PoKFK6WiKZ
	59TDYCEZtwm+7O8QH5iLAL4H4MW39IlnGh2JZtrThPAKuTMgfyG5tXsbi8ILtfGBTKzwuypd1+P
	IN/4Bv3w0j7/Q87/hrTCHCsn8PODOOPofJjkQLOoXqn2e9bzaGM6zffNyH8MIjA14n7p6vk/lfL
	MantTm59hjoqONfMfIcNhBHrg6o363KhHsngRMcQzRzXpybwu9GfEYvP6lhnNAoRzLXBgttLfAq
	azmakx5jwCsmu18I6vEolvkBitKqowbmFRbcjMT7kvkEjFqWkZBGAd0ifhcRoQx6o9
X-Received: by 2002:a05:690c:19:b0:794:afa7:5c52 with SMTP id 00721157ae682-79829037826mr88150037b3.46.1771867869804;
        Mon, 23 Feb 2026 09:31:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7982de13cdasm9940657b3.26.2026.02.23.09.31.09
        for <imx@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:31:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bd3bf5dde4so4339667eec.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771867868; x=1772472668; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=QL+JtZN1QCmCZr8o0idAmLELqhMOH+xQPJUUVWlBjdZimZtwxqXSb+NW362ZBnnXUa
         5XG+RGBdHihFKyTwURgtVuAHu6miu1n7XjXzj7Zhl/HXzW6OkD7kwMMZ85yVmcKCi0wu
         L2RmGApI+9bLS3fD0u0BTj/XDH4QI39rLcsWc=
X-Forwarded-Encrypted: i=1; AJvYcCW97+HBtXqRkhUNfr5nyJ+VtpAf56Ff8CBr65dDGlm3+xy/26RaTu4KOMDup532ZoP6QUE=@lists.linux.dev
X-Received: by 2002:a05:7300:6144:b0:2ba:8a46:142c with SMTP id 5a478bee46e88-2bd7bcebdebmr4905274eec.25.1771867868357;
        Mon, 23 Feb 2026 09:31:08 -0800 (PST)
X-Received: by 2002:a05:7300:6144:b0:2ba:8a46:142c with SMTP id 5a478bee46e88-2bd7bcebdebmr4905255eec.25.1771867867664;
        Mon, 23 Feb 2026 09:31:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da3eec5sm5168891eec.4.2026.02.23.09.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:31:06 -0800 (PST)
Message-ID: <765a981b-8ceb-40f2-b033-2e6ce529cc6d@broadcom.com>
Date: Mon, 23 Feb 2026 09:31:05 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 2/23/26 01:05, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
