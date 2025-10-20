Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22827C178
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 18:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983612; cv=none; b=Su+ZvaPQ+TKJgIBx0xjLx0YxtALf8P+5FasnrzeyEkj9k0yiPrE0WPM9djS/6RJ+f+17wdxIIQrrgt0qvBYvSD5oLpFVzehQCkXzGBw1HSPBNpTPbM8EJFwzxTacAzgW+a8vFis1tZ3SXc7Ix9saBE5zQ3xB13R8hsBjioRaBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983612; c=relaxed/simple;
	bh=JSD7zMinFfnI7sgmhr156UXVmdLj4D4xD4iX+dvck18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXiZ5XsNF0iH3l+jVGbZ/4mUf652MJqDwX6l+qPmK+OgvLU55KAbkftNKQBen9UskUY0WtqWSAR1oGV9cSwA2k8dYxOCFMkKc/SPSw47EVWT44LCRlezySmmpsnLlHPB3QBhKHhJVue4nxCfNANxJw5GoO8T2qUnqTDX6TavVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PpqrLBi+; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PpqrLBi+"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430cd27de3eso13221825ab.1
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983609; x=1761588409; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AQlGU0mYQ6QSlBwOOl9dIxsMJVc/9az/WvQw51SeIA=;
        b=PpqrLBi+X2QnYu2v4dqbMHn5n2QfJ5aSovALN0P81T68/+yOrTpw+vLpUEzeKcggYE
         7eoJQtfdE5sIs3Wubo+SIad2LBmAw966ODWjgG598gzIRcHPRxSqz92evHaWfjsT3k/C
         vWqC7u2o1bRbeUkae2x8IUpuF8WWYjJUbklWkYcbzwu5O8l0Xc9BVlqfnEPVHiLg7XjF
         9yXl/7ESgQ3OhHjNfsbWF7i5V/50ugYcJLahvihgi0Nl6KSf7QkvJAegWfvDKoWbwfVu
         zuOHWgDwharT5ENiTSo+AFvlPDGLNEBX8su1xpl5lVBzaO7CVPl5WgZ7kVTf59RLfXpO
         C3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983609; x=1761588409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AQlGU0mYQ6QSlBwOOl9dIxsMJVc/9az/WvQw51SeIA=;
        b=MyvhjcgUexjumVrsfGltyEiGiiX6LeR+TD0elhu5oAHRmwAdPOoIL8r5MSu5H1UlRK
         OYnhwv54LCZQUrgoouV9CWwdjRpkKiAsQexAWkVA5suJVLYwnGjQqRSX4pL5NIZyq2px
         lrBu1tLGRN+kMWN4CWy8RgMh3pcazttDZmLkRTSmEwWkM8SmEYFfTDyg8qcpPcVrI5Zy
         OAlGUpdb8C9lrf52G8du39vMhNp/c6VmAyBufRJ93XCANtBwF9mZyQC/oEqPHONeACug
         lKjoAWa7eTZBAbaY1wv3vrhNTeSuo021YwnEfqVK2mJH4qaCN0NNFJb2/PfPqJYl15aa
         GjLw==
X-Forwarded-Encrypted: i=1; AJvYcCVENL1bg8VXMYCQR4aPWzkSDiDjPQ3tUmVRLRCc2MiQDVTf5a+1pJadww29+G2Ea9KFq7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YySQY5+zrTtoo9B/x+OYtGGcBuUliXNK7E4rw9JPO7o1S+3tuZs
	R8WBbZwL6pR4cORawqcEZZe6oyKA83FuJBOiknuxxHspf7Zx/+mI+/XfYWAxLSkCqPQ=
X-Gm-Gg: ASbGnctlscc/oz9kNUKJsuq9XLWOHRQlsMJK1xI6XUZEVLIhwnUGqCqOTpvtyCwdMHu
	d0xK7GNdH8P+yQv6iWJXPi3srKBlvOtIaxP3BZB0W1b384HGVDwFHNhfohltS6F+Rngw6ARdt6r
	kETuWImWx3m/PXmWnWO46APNOjTXx4HbDyWYBUv3/WGipGFFTW1HJsEjcmYi57w3uVz2k9+2z79
	KHuGF/cYUMaw9yeViustOkToGf1HHPzbJK/lNAwcl4ZLaoUvELbkDUYgEnwBOPC43qaqaifITn7
	llJ5yAOUY8H15GRcmp3LyvhMD4eP2SLi4v6pSmq3N2MEftZ1ozOBMkhuc6kzv05CAc8AqBQxcDc
	Q47nqMGdP99MGQ1ZoBJ4rIMcrMuWY24KrLrVMVWK5lCXyFi7QvmYmW/G2F2YxT2r83Eoy2Jlh+W
	Kmz5/TkhsWyxcvRrqR84UQzEoxqp3SlSzjSTuGyEA=
X-Google-Smtp-Source: AGHT+IHBHKCx2YHdGAi+SFpNeca9RlxGKdmS/mH/TPdmxuSdnx64GJbh4fpZfHVsL9gExE3U3dhRbA==
X-Received: by 2002:a92:cda3:0:b0:430:b4ca:2696 with SMTP id e9e14a558f8ab-430c514e290mr212982775ab.0.1760983608698;
        Mon, 20 Oct 2025 11:06:48 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:47 -0700 (PDT)
Message-ID: <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:46 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-blinked-primary-2b69cf37e9fe@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 12:39 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
>> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 0315a13fe319a..5bbda4bc33350 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -22,6 +22,7 @@ properties:
>>             - fsl,imx6ul-qspi
>>             - fsl,ls1021a-qspi
>>             - fsl,ls2080a-qspi
>> +          - spacemit,k1-qspi
> 
> Are the newly added resets mandatory for the spacemit platform?

This is interesting.  I never even tried it without specifying them.

I just tried it, and at least on my system QSPI functioned without
defining these resets.  I will ask SpacemiT about this.  If they are
not needed I will omit the first patch (which added optional resets),
and won't use them.

Thanks for pointing this out.
					-Alex

> 
>>         - items:
>>             - enum:
>>                 - fsl,ls1043a-qspi
>> -- 
>> 2.48.1
>>

