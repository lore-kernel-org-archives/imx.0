Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C9A17BA1
	for <imx@lists.linux.dev>; Sat,  5 Jul 2025 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751726483; cv=none; b=gw9roeYmpt7boxR3XePSntmEi8oxT+roYSAqBMIjlFx06slG1DbotZAwbTyS6NEfqwiXVe706GGQ5r4rf/0qkvvP592CpVFS9lvMgKhPJqJn2I/Mys3Poal0CcggydNU3JvuXaV/71o2o8N+mpk6j8VKHt1nFUnduzZtAf/Bv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751726483; c=relaxed/simple;
	bh=x8X+NTu0WTR44qpLiT6X/kr59LV4VU1D5RBmhCLXCaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHPaWMIAG0Fmyb3dPFAgX1eokZQRXBFvU/IddR00kFWEV+9EYLDy/nmbZwPQ/kPMNJ1M3AYKEVPdbppgyhfU9deQ7hLz1D3FVw0oOfW7Ub659o9Q1Yh8rGYhErjQbS9ph87GeldR8CneLiTrnF+g0Il5jl9DczZXhRU9u/oXUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku8b7NJd; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku8b7NJd"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so3664953a12.2
        for <imx@lists.linux.dev>; Sat, 05 Jul 2025 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751726480; x=1752331280; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08BjH0ziI5ADq3xxOWwWBDU24HS4UOP00O2KNSnlmew=;
        b=ku8b7NJdp1VtISZvOgqSGxtUFO5mBEKnPTwurj0AWZnxcT1u3sQCVmTa79L//O7zkh
         tGgivUucyeF/jmSTRJY/ePMT18z/iQZsWQ0VxbO2JiNh87qI7siaPbNNbITlgmqyc5kT
         FP6a/L2Gdppf4hXfNRFOtegvFUABucFtRRq2M0UI3lMAK1ZiOdpomABOolPNdAVz2iLe
         Y1S/qPpSzTu/avLrJjFCFqbAz4t2x10EzDHK8G8NtQQqOmheiBULnNZP26KmZr9eWC2S
         9qwy0e3e7kBCcaFJSi8TTKVNwXUmfbL/62g9fnX6BGgTQPoByqSu/rZuPBh3T84xakWo
         GeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751726480; x=1752331280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08BjH0ziI5ADq3xxOWwWBDU24HS4UOP00O2KNSnlmew=;
        b=dymqCyNSn1aOZPzKTFQE4lYv+HgXUBHXBrt8hLFzSrMdHLsKirxMaHb4EsJe668cRR
         3zzWsapCyR3EI5eE0WOahjzqEf5BoENChdch4anEZkwfknwxaBy4Y4fjgjp4cd/3uxMV
         6/KqcYXF59AplXBVgXVNOuy7jghYGDtDzdUXp284jE/4cDLo83VAimqf+93F1lSJbJxD
         TCU874b1RavVdxgfAe59egouOHk4NrFLV0ybf4gd+gBX7fpFb2Ifby/AsQs+2IQDxac/
         De9snPTQEd/Qb3YyxcLbo5aSrYcQDhVzz5eUe/NIk3I81faM90gxkNKrw+nybEzWar3g
         5gkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMvKC/etjD/NfkE8Y7KFvEpqfigVG7tn6sfwouX2Q6ibweW/eiw2/Z0g3VOYmEMe2A+Jc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTDYbRiNKeFiQvTnR56Y0XiRwEY9k5H3HOMPRXEJiI0iiAHemv
	+MyY0GH/kBLrWF8EzG8kyr29oPo3N8UDoNVZrPb8KBNS0I8AXoOTKkky
X-Gm-Gg: ASbGncvMQz+UlkPLLJ3wMCQezjMlXo+dNtx7Gb+9VnnPy0x+qj+KngqhHtizH/OLCYX
	TF368eiHst9Jljba9ys6V0oENnMVQn/uhU+vkb6h8CkVjIX8sLpIEucTbmPnKn2onGuLr2JNO5+
	ce3ERk89Z0cyyEOT0Y1vG/nxlkNgZo/XdfACv9S7gB+Jk7JmdP2q7xFpTsmyLf4vwdLpQDJBj7I
	2cdJLlMnQkmYPVHsJECHew6mssU8OoUYxZA1EvAqGRI6EakcXekGiClYBlaFusr9AglalXk/ufR
	XdLTZCSvu1hbapvHxZG611HaOewWuiUNiKRezuc90V1UjrgwKwxCqJneOJy6dNHx5rna7Wegfif
	XZrkG5bPeIcNqvA==
X-Google-Smtp-Source: AGHT+IHUfbcDjacnwEt8xR0sbjyK4vWexz7YblZ9+sKMlKZSDvvhwGsTYoHN6eAfc7JmSTETLDd2yQ==
X-Received: by 2002:a05:6402:541b:b0:60c:7018:de04 with SMTP id 4fb4d7f45d1cf-60ff38a94a5mr1951309a12.10.1751726479433;
        Sat, 05 Jul 2025 07:41:19 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb0c791bsm2787138a12.42.2025.07.05.07.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 07:41:19 -0700 (PDT)
Message-ID: <225eb39b-958c-4e40-96be-272a8dc9ce12@gmail.com>
Date: Sat, 5 Jul 2025 17:41:17 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
 <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/2025 6:25 PM, Mark Brown wrote:
> On Wed, Jul 02, 2025 at 10:54:09PM +0300, Laurentiu Mihalcea wrote:
>> On 7/2/2025 9:49 PM, Mark Brown wrote:
>>> On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
>>>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>>>> missing 'power-domains' property. The domain needs to be powered on before
>>>> attempting to configure the security-related registers.
>>> I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
>>> system in -next which seem to bisect down to this commit,  I'm seeing
>>> separate boot failures on the EVK so haven't been able to confirm the
>>> status there.  There's no obvious logging, the dt selftest shows:
>> Thanks for catching this!
>> After browsing through the provided logs it would seem like no device under the
>> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is not being
>> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?
> This also appears to be the source of the boot issues I mentioned on the
> EVK, affecting ramdisk only boots:
>
>    https://lava.sirena.org.uk/scheduler/job/1533032
>
> as well as NFS.  The board seems to get to userspace but then not
> respond to serial input, it looks like it's hit something while loading
> modules and locked up but ICBW.

OK, this is very odd. I've tried the ramdisk boot using the files from the CI job: Image,
modules, CPIO and my own flash.bin (u-boot and ATF hashes match those shown in
the CI job) on an EVK board and so far no hang.

What I've noticed though is that the bridge does indeed not get probed. So, for now,
I think I'm going to submit a patch to enable the driver config in the defconfig so
we can get the Verdin failures out of the way.
