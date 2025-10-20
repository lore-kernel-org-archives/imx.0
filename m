Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A34254876
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957874; cv=none; b=Cwg+4tHZ1FUD2J9wpkwr6m9i9h7i9xcdRWsg0YwJy7hpWngWYqupgsA/rPxtwlbdCh4ZT02IbcgicNTQ8PrwDB5z0N6554xlBsdziyrHRY9UTZH6t6WN42J+o3kUgTzqIkzvYZOrpWVIOJBn/sdkDwnCmLzSh7fncNupDpakLUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957874; c=relaxed/simple;
	bh=Bla6ToecjH8EIjNTcUj1wMY0Ir7o6x4mV6qZgP7BkbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StOpmkWR+hjWhL+vzRf/4iRP1r203GfFcRQazFWa+iju4Qh/Q5Nf2oR+JLcAVM4HcjBAaKZMfleLn86SiElD7m+Mh8qVnvNJGjU9MRixJ500PmCm76FeMQW5lWL/dKJR9cgkCukQ4x6z6CqHDl1VHhzURlwZ01zIrmt/haQsgWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdxfAiZs; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdxfAiZs"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b5a8184144dso690176766b.1
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760957870; x=1761562670; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PufIutwJX/MUqRq87e43IN62sjFrJG1C0t3fcKqtI5s=;
        b=UdxfAiZsQz3uT0U4fj2qvK6rtCSjdNbaXkA/lvHjHBdjcO0kakLa4/4lEM0LRmzBlg
         zP2du066+Pcmea9GXwmSu3EygDzIXkR8z/ygJEZAV+eFloq42D+SHgr13DhMDydP9arG
         wrvIX08RAXAVhzsittE203H5M0Pg5T+DnkOoBJl0dWgBGCVCoaRp77ViwuF4VY36bdaN
         lqjrkNqb09nTiYcyjIRGB+E2G/J+stlaPEa3N2nkmZyTb44VsCsZBSC2WGjJBHRwiBRw
         RWh6Nb2yhL50JVKxdJzfwMudqtkMSyAW8e7RdHWiIVPVywlL7lgMUCSojUSE0S6ELW7x
         WSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760957870; x=1761562670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PufIutwJX/MUqRq87e43IN62sjFrJG1C0t3fcKqtI5s=;
        b=EDvgEGTclsX3dLU9SGI58jmyATpmqA/HUxv1OrTFe++b84CH5qJVPEtNwDhN+YO9Cu
         /CPh59oyOjQ5sIH4q4JYNvXxJv3/v86KoS2TMwv4jkrATClGlpk6jYSJ8iNyTfQhk9xe
         d+kCdTY98vwNl5lejStXaq3odkPGdosCa/ESskiTLRy7cWMnGJGvzYMy/bTGWM9NcFLX
         URaQZzLyDFALd3hOHSP5g+td8vkrTCyHM/aXCn+Kb8cQCr9vnEX8CqrZLLwvDbxbhKiT
         OqIWMM1Z0akfGNgzSD5wYqf3jXoSfF7GuSIKZCfMC4KQRxpKPpyE5DZe7bRGf3sM8fvD
         SedA==
X-Forwarded-Encrypted: i=1; AJvYcCV6nb3fHR11kx9FhDRDo1kHoTzebd7fQCuzgEqjDxMbzdNzEKaa36184k51lQKq9HdkUY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE+zTkeqeqjuw86tEv8ulDOffIpKlX7q7QunzsZcYdp0xELD+J
	IjZf16Jwd6XqCu0/CXhRI1AjM3p4tWsntfrRPM+lDN5OuIuTn0abEDRI
X-Gm-Gg: ASbGncsxvtHztA/4q/4pqUq/zqWV5m0uuk13nurr5aN2sQYgqzpEX01lQ3qc323kqm7
	DV933i09iwCCqcGxudHnuO2aoF6nIuAYvPErj7wkG56AyslJf/L0cydA0Ij4Cpk2a/tT+8149gg
	hgXdTlLQy8EExrEnEDRTp+omSsyAesTiY1SiK+TGhOZw3TftrhRKij0D/NjPX33W4qC3FKeTaxM
	JfRKT41GX0ScTsWyRFFnbwOUsMqUrVX6Oj+lMTHmiayGY9ndTZ7hrcuiWSn/PuREMDSgTMjJUco
	nSCLsiFnrwklP363C1eVQeRJbiHWlffaLAwfAW/sWUY8H5l3LE4YDi/Ya/OTd56A1PPd50PBbu7
	c41nhSx/SIrRJQktawov5QuGZMUhfk1ppr1r4jFDIHmAej3iFE8fAQDXZgvMRm/220WhoPwlnVZ
	hQHZJjSDat85hqaLMsCumGsjQStZ4SJGBy/MrqNo6BDKU=
X-Google-Smtp-Source: AGHT+IEGNGRqyCA4oo2Whj2ekIc3ahNm9oAu93O5XQjpUk9MWXWOqPcdHqIk3lFTx8TLeoPA3wFzBw==
X-Received: by 2002:a17:907:2687:b0:b57:78fa:db46 with SMTP id a640c23a62f3a-b64764d7dabmr1614004666b.43.1760957870288;
        Mon, 20 Oct 2025 03:57:50 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7e984f2sm749179166b.13.2025.10.20.03.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:57:49 -0700 (PDT)
Message-ID: <26f1b9ef-2e90-476c-8f95-6bae08f69eb1@gmail.com>
Date: Mon, 20 Oct 2025 03:57:46 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
 <aPJSk2spnihEEkas@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJSk2spnihEEkas@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/17/2025 7:28 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:18AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
>> "memory map", the definition of the EARC control register shows that the
>> EARC controller software reset is controlled via bit 0, while the EARC PHY
>> software reset is controlled via bit 1.
>>
>> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
>> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
>> imply that the EARC controller software reset is controlled via bit 1 and
>> the EARC PHY software reset is controlled via bit 2. Fix them.
>>
>> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Just curious, why previous version can work?


good question. I assume this was never tested so I don't think the question

of this working in previous versions or not is applicable here. I also looked for

the usages of these macros in the DTS and there seems to be no consumer.


I discovered the issue while testing the patches from this series. As for testing,

I used a dummy consumer driver/node and manually checked the register values

after each reset assert/de-assert operation.


>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index 6b357adfe646..eceb37ff5dc5 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -14,8 +14,8 @@
>>  #include <linux/reset-controller.h>
>>
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
>> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
>> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
>> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
>>
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
>>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
>> --
>> 2.43.0
>>
