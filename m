Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D2134D3
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 17:11:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so449005866b.2
        for <imx@lists.linux.dev>; Mon, 28 Aug 2023 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693242659; x=1693847459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVpQ/sEJMXX+kJm+GyyE29h4etZD3k3PLHQlncbkWnk=;
        b=D/SW53fhf8VrQ5lJnCNZHsrzDZhnWFsD7p4TMODQSe7JwQAQoMmTB10liIcUSKtNAg
         LwR5IWMxY9AWo634sxr3hChqpsatMtfxPjYqf4iorTYlJoFJdhBCsAyUC2TwZY+yMNxn
         cmdxZwmeInzaFFH86SkB7c+7ieKk/UJazgBCNaZaRpuNqbfssGeNINELVW6sf3KW6BZq
         zRigVEdKWcvVHgHVhPU0nQljCjmjyJDGt8Z7NimYFE6L0w8lxHaQXwCjUtNTkJ5KV43m
         XdWEXR4syi0jJy5bASr3qqAMOaQitQArClBczQB43zxJzWQZDlA0Lr6mh52qZjk7ydKq
         iftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693242659; x=1693847459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVpQ/sEJMXX+kJm+GyyE29h4etZD3k3PLHQlncbkWnk=;
        b=LdH3gJmkdRKN4NSnUhqj+Soey86nVA9v7sgTZwb6OYin0uRJT/0V28DGZSp58J3XFA
         6Roj4S5xH7r5y3G2OztFrpaPHRvSFCJGWPGHHVmjlccsebGW8FDK9rildEWOu9hxbdch
         J3O5DHzyfvp6TWmdeRKRy74VPLA7KZOFUedd6+7rHWn5xa1NNxQ6U+BqWxXV4B13hQFU
         nIY/XKDbFt+zne6Y/dQjD5pRoUGlrPPZx6uweKKphI2ZZBc9xc4pFvvZdMCTq+dbIA1b
         zCaJCD0o3zzUf3c8YLjCS1yoq8sre0ZqKWvSUPzybRBK+oOzrMVqBAXEd+IHIjZKLFCz
         WIcw==
X-Gm-Message-State: AOJu0YxkAsnyeMe/VZB9B8jToxF0weHPEu6f7/gQpk2vPXf11+kkcRXD
	NDwoZWMqkfGkIPOiXDx39NlAlA==
X-Google-Smtp-Source: AGHT+IHi4xv34woK1nBgfW2VEtCq1AYYhJy6Oirt48MbuAkrveaTIuZx3KwuZGABpegca5nmsDb1cw==
X-Received: by 2002:a17:907:60c7:b0:9a2:2635:daab with SMTP id hv7-20020a17090760c700b009a22635daabmr9198583ejc.47.1693242658873;
        Mon, 28 Aug 2023 10:10:58 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id sy22-20020a1709076f1600b00992d0de8762sm4795624ejc.216.2023.08.28.10.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 10:10:58 -0700 (PDT)
Message-ID: <51fe3126-16ba-ade6-b106-e3683f96ad26@linaro.org>
Date: Mon, 28 Aug 2023 19:10:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAPDyKFqsn6kVjPFUdVyRxNDiOaHO9hq=9c+6eAK4N-v-LVWUPw@mail.gmail.com>
 <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
 <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org>
 <PAXPR04MB9185957B729588D3E7CA3A5089E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB9185957B729588D3E7CA3A5089E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2023 16:04, Shenwei Wang wrote:

>>> Are you suggesting to move the regulator-pd to the imx directory and
>>> add a company prefix to the compatible string?
>>
>> There is no such part of iMX processor as such regulator-power-domain, so I
>> don't recommend that approach. DTS nodes represent hardware, not your SW
>> layers.
>>
> 
> That's not always the case, as we do sometimes need a virtual device. 
> As an example, the "regulator-fixed" acts as a software abstraction layer to create virtual regulator 
> devices by interfacing with the underlying GPIO drivers.

Not true. This is a real regulator device. Real hardware on the board.
You can even see and touch it.

> Similarly, "regulator-pd" provides a software abstraction layer for virtual PD devices built on 
> top of existing regulator drivers.

This is not related to regulator-fixed at all.

> When looking at the conceptual purpose, regulator-fixed and regulator-pd are comparable in 
> that they both offer software abstraction layers for virtual devices."

No. regulator-fixed is a real device. Yours is not.


Best regards,
Krzysztof

