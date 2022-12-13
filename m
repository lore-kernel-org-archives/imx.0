Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEFD33D4
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 13:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13209C433F1
	for <imx@lists.linux.dev>; Tue, 13 Dec 2022 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670937660;
	bh=bHA+mTh20LO8LfXp7Tr6JCJUwbx5KaIlUkFvEivaSzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lgcjat+t4w3QN4ynKv20n7wNFsr7mqGOsQyvyv2px+fMlCHrddRwMo+f05JrJT7By
	 W7CzoeGsVt9BxRdk2gEX/OFto8qjIUsgpQs6WsPdHvPP1x4FenxEEyM8CUNFA+FDLs
	 RrNHb+X8xZlytAVD1GcC3csvoR0VFzm6SnVCAL6vtc8sPQA2krvLtiPjJD7SJMvtFE
	 k4UPWytFON65DMsW1P8Sx2kSTE37JONMaaDKf/flyYzXxzItYYvgG4QgnkN41UmYN7
	 BB86XaqRH8WEzHjVRZS5wbf0NskdYaeQ3oHcVaPE1xl6yglULTgKMzqr6OKP6dcpBm
	 APp+SM4e0JGkw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3b5d9050e48so191077507b3.2
        for <imx@lists.linux.dev>; Tue, 13 Dec 2022 05:21:00 -0800 (PST)
X-Gm-Message-State: ANoB5pnae1LUAWJDVyV4dYA1aqLAr6VdxM+Mfd5Li6tWkcAPOaAbDDn6
	ES0IBC3UeEKbFMqd0HP4cGNB4Eks6fBBRQLlYg==
X-Google-Smtp-Source: AA0mqf5XDXV0XjkQ2YnS86NqU5WVeD2D8De6xdaMRKOLg/sDbcSF6jtPmY2sHOZT4r9U4WfB8l3vhZyYVG/Wj+0XOj8=
X-Received: by 2002:a81:6908:0:b0:36b:fbd0:2f6b with SMTP id
 e8-20020a816908000000b0036bfbd02f6bmr8036221ywc.387.1670937659013; Tue, 13
 Dec 2022 05:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221212220716.1829183-1-han.xu@nxp.com>
In-Reply-To: <20221212220716.1829183-1-han.xu@nxp.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Dec 2022 07:20:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJnh=N_6PDFDr79aUa8hcd44trvoz=CfaFGBVO2-Y8Szg@mail.gmail.com>
Message-ID: <CAL_JsqJnh=N_6PDFDr79aUa8hcd44trvoz=CfaFGBVO2-Y8Szg@mail.gmail.com>
Subject: Re: [PATCH 0/4] FXLS8967AF and FXLS8974CF support
To: Han Xu <han.xu@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Sean Nyekjaer <sean@geanix.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Clark Wang <xiaoning.wang@nxp.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 4:08 PM Han Xu <han.xu@nxp.com> wrote:
>
> The patch set add two more NXP accelerometer entries for FXLS8967AF and
> FXLS8974CF in driver and update related compatible string for dt bindings.

Please resend to the lists that get_maintainers.pl tells you to.

Rob
