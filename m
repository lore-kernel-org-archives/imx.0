Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B5317BAB
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711394520; cv=none; b=uA77VVt3RjIKqk38HVc5JNTsFuf/VHQjZkCtoCC2k7ixLq6X5WqAnnPek/w1oEgwLgDAgT7PpZ6ojS5PQGvKsZPSvTJdKxX1dm+yZKzE5ATUysljb7nVmEOEysA8LloQVd5P6DyhfYdFoW2kCRZ4Ax+ehozB0QmXzvBHDrBIsTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711394520; c=relaxed/simple;
	bh=8ZE0sCy+pVfr4eIziHQj15HhXBrjbpT+yTW1orptgtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7lt4j8Vn3w1DEELfNqb3VH/+ZhSyrEWHg+75EO7y8n9PQUrx43fMtrm0zLOEUlT3bIo5fFNUPfoCGzNSUPsd8Zy3jyjcvCC7ZGE76Jj3JBfiUgX9JlPb7Dgcu9LL3HqEcxkhGNBhH5aWwk76FnS3VgOqVezPfUFL4Ua7+wjL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+XuGG7Z; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+XuGG7Z"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56be32b9775so4254301a12.1
        for <imx@lists.linux.dev>; Mon, 25 Mar 2024 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711394518; x=1711999318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1paNpn3VmAaNKaARtJp8KNuL11lvfBIGQ5nTyzBZWI=;
        b=i+XuGG7ZdaKJePje6yHoIgOn3impcK+8YZQKNCqGonqTXJlv5Fdtay8GJX04V3x8z4
         p335J3hYgjkCK8I7QfAUGGIOZvM4QwP2zt/4Axj8fhzBUJGgLubUH+qsWRyQBHV8jsrI
         7XVjHONYy5CaFkfVitbKv6o0RqsRFAJ+bvnhdTqSn576XbrP04vYlgy1PHZIdzUZDiTp
         sT5C+yiwqnSZ+3/W0f6fhMzVMe+GBu23eKm4bHZpMeNViOPNHz5vdXA9axGU7FsjFLIs
         iSo92GfCw16ZjNHy683fzeMpEkO/2P6EYGVsFmdQWEGWrspYhBg/ro2VRhwAkqxiyMqT
         LaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394518; x=1711999318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1paNpn3VmAaNKaARtJp8KNuL11lvfBIGQ5nTyzBZWI=;
        b=iDfcWDXi7Cb7yqzVxxLp7S2kIJcHP8Nb6NDcx2vDcXmQfGDDAG9Ja+oZzU+P4Mc7vq
         lbdCwp5k/35wFIESQX60nwnK58qW8x4/c3cvTj97VyFRfdqA/hsStkn4DgtO/TDmoTxx
         9wN4Jk8EtO+iqxUAqIiU0v9gpX2Ztydr1IYzvxZ+TOTNpxvbt0Cp3e4kK1N992YQhPzs
         ywYiBpfv/BoqFByfONrNsuYLQcjgMjbRcCnxEDFwU/Lr0pXznCjT2yUkDkNo3HPMRsbi
         LVNCn6S0V2tdSoxjXR0GXWk3bX/X2LyWcNZqNIBmRK58qLCFVq7Q0fYW0777dDS2ElRV
         I4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXwasQmgrY04bjOMBSbwKWYoj4V/YBD4gih0wjLyYhTWB8WIbiqK8fgmdSfyF+9CPQ5IUNiaPRmqgOOH0U9gGRWgylo
X-Gm-Message-State: AOJu0Yylj042mGI0pt7GX3ToTXpgEVaa409vEhMa8vrpO1OyC3ddtVXl
	nkioqU38p5WeKweYL98DioVBffRQYDQleU0A+zTeQ9ia4iRP/YxHmitYF6t5+fc=
X-Google-Smtp-Source: AGHT+IGcH0jMsTYIMctITiHBCSa+G6Y6vNVNEJmcEifGTyT3iG4cZQWjr4ZGbwMH7B6tmRi3m0+jLw==
X-Received: by 2002:a17:906:fa0e:b0:a47:3447:865 with SMTP id lo14-20020a170906fa0e00b00a4734470865mr5371514ejb.19.1711394517707;
        Mon, 25 Mar 2024 12:21:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b12-20020a17090630cc00b00a47342b53a4sm3334612ejb.191.2024.03.25.12.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:21:57 -0700 (PDT)
Message-ID: <ce1b814a-6b1b-4773-ad29-b572d00f56c9@linaro.org>
Date: Mon, 25 Mar 2024 20:21:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Add support i.MX95 BLK CTL module clock features
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20240324-imx95-blk-ctl-v5-0-7a706174078a@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240324-imx95-blk-ctl-v5-0-7a706174078a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2024 08:51, Peng Fan (OSS) wrote:
> i.MX95's several MIXes has BLK CTL module which could be used for
> clk settings, QoS settings, Misc settings for a MIX. This patchset
> is to add the clk feature support, including dt-bindings
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v5:
> - Merge bindings except the one has mux-controller
> - Separate clock ID headers in a separate patch per Rob's comments

Where did he suggest it?



Best regards,
Krzysztof

