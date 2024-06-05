Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086618C337
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 07:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571894; cv=none; b=m7UuzyNTqgS5OdFUQs8TEjDk0iHvr800Vq/cKkS6MpgIPVcoq2qkdEwrn9VGkQHh1ZV7Q/6MMmKFlBXOV8hFLfabnFTcEft8nOc1gOC/i2w5Bd7d/+Ve/U3cFdDxLkDcH3/acuEjVKsrIDbi4lwFB0/N3FMSl3C330HeaPqDhI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571894; c=relaxed/simple;
	bh=dLZfj+lF2pdzUNgY2vq7Z5VyS4ll2D19Bifu/3ACJII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmQ6NDo6sqeWevK5EZHRi9F2oLaejkBs7yEsA1VEUvP6BkqwL/BjLVXRRSABc3Yia+GjFrUjLnpk0ne/G4pUWa91Y2DdpWXJ39B1BG8j5GvdGmVbucZbmbQmggxW7M46yYbQ4Nl9myvYVrkbKl4QyV/WMW1s6KcFan7vJXwZkd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0QS+KmZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0QS+KmZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a68f1017170so197644766b.0
        for <imx@lists.linux.dev>; Wed, 05 Jun 2024 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717571891; x=1718176691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFZLLJugyEkXACayOyd5Vqrj8cwmkHVVSRUdcCX1r9w=;
        b=P0QS+KmZ4IsOeYj+QbFNWM7jcelQB2FSPPpaHP8hZqLbyJGyHWN5kV9wt8y5tRCPSn
         WJ8RgYO2gsglEKj5r6yJDfSc1DOrV3Z4q0x7FLmV+tWR96T8taSY5ZGs8zB5xs+MNzWz
         MB4yXC7vIzMsaY4MRXcO6fKcrUKYIdoVGtJ+LsbToXFgBjDi4j0lF2JLxRUgdbDQF6GP
         UMr5nacLn9LjMq5rq3EFsQWYdTzmdESKdlftlOcNojUhx2RgwzUXHuCGVAwxuHeC070j
         2p2LfNWQfJUXWJgqb86BA4/RB6CR+c0T2g+KkQMUa/U3YdIe5xPqCyn+BVMbgNzgZHTo
         36ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717571891; x=1718176691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFZLLJugyEkXACayOyd5Vqrj8cwmkHVVSRUdcCX1r9w=;
        b=UGRTZvufBrEcEV5uSt+JrVcnPy3N+NF1DRaA0Ei1XfNZ2uNhx1cBM99pLrpW07Nipx
         ALniEwMLeNO29qVe6emM0ASvIiwo2pauZLCNRxMOErezpiS1uY4gWWA4ZB6Ngfz23xoH
         TZmzPcQh4cKBqVN6aTHE51Am7EAdVTFu3yOvBEfyxW/uwR7OyCJt5iOl+oHufXpIcmdZ
         OIiGVUqduhuGeAnXyTXxrdVMFXry5gpH1r8XLWfDRf8aB0oWXQ8M8xbcB0v7BPAHG9S+
         Cep4PUv3ikyadnzhHFWHgc+3NeOMqupdbAr7/CTcZ9b6wKY3GkO9nTAvDa+qbGyAzYEx
         EevQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlWi8gbeJrvYwHJfToJlhnRO+Xrsk1A9Y5RZjAlh03r9P/Ip9iCmGzOybj13EG7CONo5IUX02qVBNo35HIbfvuB8di
X-Gm-Message-State: AOJu0Yy9/LDHi7zps/1H4Mo5XQaFccWq0qOkQ8s6F0jDAj6ZrxypbDgG
	aYgWVuXDQ+B+H0wCtAlYts+plrAb+phZ6pKIzd/eIokmX7LqmOBqKC9fx8VO0ige5czQFWN1lwS
	mBhYxD/nS0ZzxxBucxGzl/YvC66A=
X-Google-Smtp-Source: AGHT+IGCDDriZeoft/BQkhFfCJxIbesa8W3MH2Arr0IrBUIEL0fsCEGslzaYr5dbseFZeSfmz8I3ox7Q/mLHlr/UNSg=
X-Received: by 2002:a17:906:3786:b0:a68:e335:3e62 with SMTP id
 a640c23a62f3a-a69a0017340mr101774866b.72.1717571890486; Wed, 05 Jun 2024
 00:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240605003356.46458-1-animeshagarwal28@gmail.com> <1b98bb9a-8373-4858-b31b-37e6f9da453b@kernel.org>
In-Reply-To: <1b98bb9a-8373-4858-b31b-37e6f9da453b@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Jun 2024 10:17:57 +0300
Message-ID: <CAEnQRZDWFN2Fwb5Kxn-TkP_uUah-dz-fSO7t0MJjXFgW+5hixQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: dma: fsl,imx-dma: Convert to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Jun 5, 2024 at 10:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/06/2024 02:33, Animesh Agarwal wrote:
> > Convert the fsl i.MX DMA controller bindings to DT schema. Remove old
> > and deprecated properties #dma-channels and #dma-requests.
>
> Where? I see them.

What you see is dma-channels which is the newer properties. We removed
the deprecated ones named '#dma-channels'

See the original txt file:

-- dma-requests : Number of DMA requests supported.
-- #dma-requests : deprecated

Funny or not there were two properties with similar names the only differen=
ce
was the '#' at the beginning.

We removed the deprecated property named '#dma-requests'.

 > +
> > +  dma-requests:
> > +    description: Number of DMA requests supported.
>
> That's confusing. It is supposed to be deprecated.

No, this is not deprecated.

The property starting with '#' is deprecated and we removed it from
the yaml file.

For example you can look at this commit:

commit bd1eca7b2c66c53873a0eab84f9f301aca41f33a
Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date:   Tue May 3 08:54:04 2022 +0200

    dt-bindings: dmaengine: mmp: deprecate '#dma-channels' and '#dma-reques=
ts'

    The generic properties, used in most of the drivers and defined in
    generic dma-common DT bindings, are 'dma-channels' and 'dma-requests'.

    Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
