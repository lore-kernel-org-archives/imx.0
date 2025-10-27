Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A29274670
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578269; cv=none; b=bjJv/KFKp9XSZxuG5HIjVKhzptfK+ATTHvIf2KIDmd6X6ADojH1W86BR7JmfIBOa15NQhCUPyEBf0BgaNpSbROiVx2xofLf/bA6IU1wUuewGs7hUc8LV1ihq4cZ3xQjiSJCVihkTgWbQKS1CyJ5pqYX3DACnASO5S6vYzlhomqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578269; c=relaxed/simple;
	bh=j7iaI6dMKBMwEA/p9J76DQJqd78/n7N+OXj7MgdoWU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dath9Vj2tjQBipczmjp8NkrgFHGG28QCTr3uxtTDfO/UD+4OVBDWG86/krSThE2aIb9ASQN0yqsBkuRnYGngnpm4giMyTQTHaJZMnoAPntRIwtcpypgKGNb2E6Nuk+pxohwaPe49XEYnlOI60VRcTj4K6RE829UO603KolgB000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhuIogfr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhuIogfr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so1073272666b.3
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761578266; x=1762183066; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=;
        b=LhuIogfrQTF8OYYTAv1Ci7iiHOrheibcEGmfCUQcgOO3MI/14vgZmb5fKjbPNPHg2d
         vmTHG4p9PBp1wLNAxh2ugs+vK64CG/pyi0K/waXSYVNeXQtmtwc6bD/lE8DEFiIXs3G4
         3HKIds6iepJtD2IcATwjqyqpMt2vmMpxeRsBztUF0pMDNBqgqyZ3uw/zBHJ/Ozr/i9Ut
         PTlJ6QALiwsI/z4OycrcAVmrPYOb56CrS8qIrLBIQy6NpYksXKNARPf68eK4vKvKeBbO
         Uy5SnRg0hjt7sCtti743zLzPc99OsaGj8w3hviYRBc+W3u4kaDmUDpfe3ZkNrDGJzKvo
         FRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578266; x=1762183066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RhaaAECagc9DFp9XYeX6cR74fQi362tPJsuNQfwUA0=;
        b=SUi4ujkatiDDQROaaRkGgtl8xnvTQ+Sh/4TlRXAqg4MxX8nRJAg7gbsIq6PfxMDG48
         2VEhdzzo9me/J7gf8ZnsNA/Xf2TCIN5LuafuEFUH4MGtFOuw+r9uaxG+QqYNDF0D1E7f
         1tXKovHK1vEwmOEQpwYssGzMTr+OwF2ApI9DsBW7sU4MfxxJf0VUpHOocGjkqRnN0Smk
         zZzCrKQQTZ5LDkGfohf4a1us2pjTjhYO0Xj1Ln9EqtUyTrMlUTvZqlDZMnPmYHePc3vA
         E2xArIo0Hbbfpu6lN7Xj3x1Y1la/L7ioQtO1w/j8Kw0xJ/50HS8STGizeBRh3oJvIY4T
         Q7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCULep5ube2zkpJxDG3ZwxmRPp97YmpU1Rjw0EEjA+LEv8PFh1D/Lm8lGLm0MBqkffd82mw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5vRuEgbm0tYlbjgXUh7CNkbee5zZFviN8XaGBZjVoZlFN8/cR
	0kFeRfD8FTuBimmrhahVLvYm7FZLDMQNyKUcjenHWCj+fn4/UX9USBQ7
X-Gm-Gg: ASbGncuRS10E4U1thUrjk2+NFULI9EAMf167RsJnDldwLKJihjK+UpU4K7YLdRwWdtr
	JK9OmNBKfeevLVo1K8gRWFOmHrh6ZXzGoQ3o/50Q0zpqh+HvZWJoEwoTcro+BVK5BqxYqzjGR1E
	foZWFKNh2qu7c2b2pcllZ9XQcCA7yWU/GyCODYu2rFfJ3aXFLWT1m14bomqJswjx2ypD08wDCO7
	NBpLAPRAUekfVOiw2P/hcpvSu2MnzM9vf3mWhhbY47H7yiWFNrpf/cHxfwPBNUGI6UDs19b0UTk
	Cy+VVjyJHQlocQWW8Z8R2CHkUYVa8DdFmFVT0PjGBiqlx7agNEDa2rLHfUauyZhdUn6g7B91ldS
	dsQs6woZXz4IEfjiDxoVDlRwy2lQ0OxAxSBpeCtV79qsjR+nl0+oPYNoIJXHzLe+Z5Z5FZfjrPE
	kTnPeqdhqImUmto7ybUcYbxE3pEZSuPw==
X-Google-Smtp-Source: AGHT+IFwRk45A3Ur3DKKqB7hUJTu/XpniiqiGgHDiWfPN2WS4tjYIiwIglRdwwwXDeEdp9t66AD1SA==
X-Received: by 2002:a17:907:97d6:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b6dba49c6d1mr31539266b.28.1761578265848;
        Mon, 27 Oct 2025 08:17:45 -0700 (PDT)
Received: from [10.25.208.2] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308cb0sm809592766b.9.2025.10.27.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:17:45 -0700 (PDT)
Message-ID: <feba1845-5f2f-4716-950c-9abc7c4594a9@gmail.com>
Date: Mon, 27 Oct 2025 08:17:40 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Peng Fan <peng.fan@oss.nxp.com>
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
 <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
 <20251022140841.GB11174@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251022140841.GB11174@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/22/2025 7:08 AM, Peng Fan wrote:
> Hi Laurentiu,
>
> On Fri, Oct 17, 2025 at 04:20:19AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for i.MX8ULP's SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> +description:
>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>> +  line assertion/de-assertion.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8ulp-sim-lpav
> This block also contains QoS registers, General purpose registers, HIFI
> general purpose registers, and others.
>
> I am not sure whether need to add a syscon fallback here. dt maintainer may
> help comment.


syscon programming model is NOT compatible with this programming model.


If you need access to other registers (not covered by reset/MUX/clock APIs), you're going to have to either go

through a subsystem API or manually create a device link between SIM LPAV and your consumer and then use

something like dev_get_regmap().


Either way, you need to make sure that you're using the same lock for register access.


as for the interconnect QoS-related stuff: can't really comment on this as I haven't worked

with it, nor do I have an use case for it ATM. However, the binding does need to be complete so

suggestions in this regard would be much appreciated.


>
> Regards,
> Peng
