Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61863570DC
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757432076; cv=none; b=GBbmLd1b/mkvuvc/QsxlMiqFQFriDcYUiYVocOFYg7NqbrZ7hDGeISrIpzY9+zTHvWUOnB/EXM2g2CymstlapvBwQ5DrNKUpg+imq89twU+dKRzIHakrbgRlnfNgp3bzUQcnUcFJDB1wDYtYe+CceTzBYDqeipGAOB6B2hy40A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757432076; c=relaxed/simple;
	bh=8qTa9xeWxgzia/87N+H0CPE3siON5KYKzADDzEoot48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8cfrJ1SL3P/Sl6NYKVPjXU/szfGS/o0vZoJFx4zBXJ1Lzz/f1NubfhVfII+LLavQujtCT9iNuCeQf50E01518MaOfCUiaEIFMw0meKMH/xofdHvSUWvXbuGkYEWvd403wsVpQBhpj6zP1GyCOrHb1BAoep7PXbjmXMQTa3LbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzIa7Kh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzIa7Kh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC96C4CEF8
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757432076;
	bh=8qTa9xeWxgzia/87N+H0CPE3siON5KYKzADDzEoot48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fzIa7Kh8A+c4euikmlUP8hLomx5oWx3DBAZ6jCnnIagemusOCdrxQi+2KaoWh7TMZ
	 +MBpoROERj82RLZTPYdtuJgmmggYqlwvNIvQ/O1S73WoMPpMxauUMKTp8RR98ti9VI
	 ZFq/XjW3+lKnz9kl0F2gnCBxkUPJpOrXyBEtlDtEt1kItt8TIk9xDp5gIieCD+Vyhy
	 Yv739grGcrfZ4042PoTWTfnAnT3j4cWC+JPaN6TjwMt9IzyWf1kLRxv+rFtCdKjs2g
	 uu0wbaC1EtIMudDV43mbstoOiQy+H+0dEqMgTDqpYVVetuoqNoINgsS9OMipNkb5+b
	 ehhNxx3sXZAbQ==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-746d754f656so3320979a34.0
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 08:34:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAPhWvNCrbWkNvZUUHO5CWGgL2Txkfc5lO9bKcRswBna1eoEXzaQE8lg0ApaBjSgutYn4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCEfjt0XEVJIE7u9Mj6EHIJJ9tLm5BFJRJvluJ93UvmqDQ+On5
	3lQzrbP2Mnlyks8Ll5pNn8rqGQ53pvh6uSNKi5DB4npgCJ/SARXy1WDjqVxkNlHJ689CwnXt/yD
	OqQGG/0bGwVbeqYV9xybLfgblwu1gvSk=
X-Google-Smtp-Source: AGHT+IHWaK8rYsvG12LJ1v+wQd3FH4Ew6lJ7hajdwsT4NMXGUbcx+CA4lOF7uu7KaVTgx45qL5upgAToWfN8TS73sR4=
X-Received: by 2002:a05:6830:3692:b0:745:98e8:d7cb with SMTP id
 46e09a7af769-74c7192d474mr7456377a34.12.1757432075741; Tue, 09 Sep 2025
 08:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908053335.36685-1-xu.yang_2@nxp.com> <20250908053335.36685-2-xu.yang_2@nxp.com>
In-Reply-To: <20250908053335.36685-2-xu.yang_2@nxp.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Wed, 10 Sep 2025 00:33:58 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1ts4_qO4L9X1ZoYtr0SGLW+3EBCqSybntQLGQztALKSA@mail.gmail.com>
X-Gm-Features: Ac12FXyorylKhwqGw0HT9IiTuqn3a-WrKEI_gkRmAKNLzi4HndmDxi15M7mbjSM
Message-ID: <CAGTfZH1ts4_qO4L9X1ZoYtr0SGLW+3EBCqSybntQLGQztALKSA@mail.gmail.com>
Subject: Re: [RESEND v4 2/4] dt-bindings: extcon: ptn5150: Allow "connector"
 node to present
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	swboyd@chromium.org, heikki.krogerus@linux.intel.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Applied it .Thanks.

On Mon, Sep 8, 2025 at 2:34=E2=80=AFPM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> PTN5150 is usually used with a Type-C connector, so allow a "connector"
> node to be defined under it.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v4:
>  - no changes
> Changes in v3:
>  - add Acked-by tag
> Changes in v2:
>  - improve commit message
> ---
>  Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml=
 b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> index 072b3c0c5fd0..79f88b5f4e5c 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> +++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> @@ -42,6 +42,9 @@ properties:
>      description:
>        A port node to link the usb controller for the dual role switch.
>
> +  connector:
> +    $ref: /schemas/connector/usb-connector.yaml#
> +
>  required:
>    - compatible
>    - interrupts
> --
> 2.34.1
>
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
