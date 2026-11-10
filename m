Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297475;
	b=C4h8jxvpXirw9wTg6rErDdIuDtA7OtNHku5UFsxeAGOMmH8wGy8xmRFLeJBraJOJD+BC
	 Up8iVtN/OAm1tjvlnuNlrAD6EtykUEB4AgFE3plV13XXyzl9YdTHo5COK2Gtqom0iY1G8
	 UEZ7vgT1gkTn0suZ4qGMHcdne3680DWseonZZzAOI5YUJAM7GuW/YO1XHYqk18ksGMHiE
	 /K4fXr7Mky+oTa5Q5b7YAw4Nb1rF6ZfafqOA9NcU82KJQ3PTN9GYxE51CoNUKt93qLPSB
	 MkYL7KRo+BP0aSqhQCOHsr9pTY7Jf9t/pSfOJ7RNNWvWRkwU+F88woqk0RHghGavfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297475;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
	b=xMVn6FapLLAGKR3/13YBX9zw08aGRMdyFSpLxmHjYGMrNJvK6gEZN2RPWxKxIq0A/HP2
	 g1Qb7K5vyRlTOvenyXoAZ8QxxalEZOWsWcD/4fBDwWOX9wnTizX/9SCf5Ro+Iwqccs95P
	 no6fddKRDxdRaSjtfUwCwT+nT+wJcWKZPeBgJ0ntpcbR+/QVRm5Oj9ug2DwjHngAsxq4U
	 3I3DigheMJtRhMGbsqAVjhgolqjiyx2vazx/QVmJrj4eLhx7IA2LkuCWaPkopl9KtqRYi
	 ub3zu0q3qOi6hDTK+Awar0xLepdA7OfWhjfWAYxv8FLAAESgMfFM7SLVViZbLTWAvOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067A606A335
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 07:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7067A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so616479137.1
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 23:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297474; x=1794902274;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
        b=RZKoWwMGTqJip+8gjBvL2Py9rhZSkQZ9oQtqdU0nZsQBrKALy1MXTJ8K3U8o586r2b
         fd4VXsYvaFSD2zgNFVT8XJm8W1qaBH4iVu7Bv9TwFyetMsfE2nAfUCfnkvpT7j8o4ac1
         iqGXYluPJOVaRXBgJlZkv2Gi7QRdYbiM32z5SnbIw26pikOTbAq7pYGQsSWOjPtlj7tt
         B8JWxvzMuvvAHFweSc+MUeBEofanCqvzDsWfRZz98ZKCpfIncqXmurXQVBcGrUXBI9RD
         X+tJg/5rGURUt3AxsU3AsLOPcJbiwfN1SVDXq88Cl0Il55VZ1i2Umgwur3dRwjz0K33m
         peGw==
X-Forwarded-Encrypted: i=1; AL+hErFeN1DK8Fks7hv/Ked8qEH1Mk1HKgC+CuH4MRMQQZ8psXDHMxH0LB84UHzPC2JTQOXPhNg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/T7hB8FzwDG5shNeBNjjnjchhNY6oHsk0H47oAIEEHrVad8zy0
	oq24VK6DVXLYwnrwVxAc83NYNNADYGj+bPVNepgYxZlbONT0rs5I54MQ+VdTgV6tzQY=
X-Gm-Gg: AYBFou30IuUqsv4hHbEH8JbcFpMecGQXZfGngmcMBKxEXJQTAi6mow+ICHcdJ1r6JtV
	yVvVq5fySiBdC1uVVphUioZ5UPUNoLU75Q6v/y3OfNmnGHUrOoRcFIp4tkCvX/Wh+QTUdtH9czc
	f2ebT4bpU5eL5xS2AApNC3DehBJ09u5mFO56twnL/rnE+KXQ6G81Q03Cs/rfdrnLT1Iqerbvzif
	7kCchP3KUKpc6ou0zQhkbVbTvFIhVd08OHJvF7hcPVZh/YTddI1jDizzWbO+CCmQb7IQAk3LZKe
	AL9JjSPHC+RX/8DvV9hG1rF8SDShUkh0c46sBvcUMj6QrgMImCprPemLjGawtlHOoSE9q9678GM
	d8Dj1dRWHUo3VQO4D4A0FWhMGUWD9ElwXD+lsJc2QVRzGUQxJluhae6TKNUgrQJVXtBAQBFSoT6
	Q5eoH6f+9gjj2lONj5OgWK+WWDiLo+yHfuGFzS/lBahm06NOpncuiE2sBJtNSJlAbq9CxxAjPMe
	EAztryFYXClW19alC9UtRkBV3bcKLyGHZu2c99jk90cZ1sMzqC6lZ30tYPT8g2NvxlTEz17fNzW
	5o0q/QUKLsllFRe+pzh4+hs4ZYgkbBZTH7d0izItKsZ2qsd6WRpiy9SEuoXGh/RdgWs=
X-Received: by 2002:a05:6102:1487:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d301bc9f5emr511160137.16.1794297473668;
        Mon, 09 Nov 2026 23:57:53 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d30223977dsm1218504137.1.2026.11.09.23.57.51
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:57:52 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc91ddf447so719142137.2
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 23:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5orcRNE4+jltwSGzqNSh/i3wPujDZct497cPD1EAfRM/LiqOpzfbIlNcRupHcklrM9bY=@lists.linux.dev
X-Received: by 2002:a05:6102:4190:b0:7c3:2b19:6266 with SMTP id
 ada2fe7eead31-7d301bfd9b1mr443049137.22.1794297471476; Mon, 09 Nov 2026
 23:57:51 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
 <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 08:57:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
X-Gm-Features: AclHuK9JsEgh5r73zJDHAyGi1UgY8FApv7iweIjEvmBZD0LvfpJpCmquM1eWYd8
Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: remove redundant pm_runtime_dont_use_autosuspend()
 calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 21:51, Joshua Crofts <crofts@kernel.org> wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
