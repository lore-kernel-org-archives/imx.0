Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5082253B7
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809487; cv=none; b=iEdjAE6TAkvp4H3Yf1xa11FOwAwMmwNhs+HPvS2Ol1rBGrPnQJTA7Bvm99Ui9RAg6poNasnFJ83okuZ8qem8BYF/fKmi3wATAfHqC/cgVPFJa7zSdQyZYMqVAe385TTQMevVZdZJSIOVEKqWaP2d+h+lNtbASoLL34wxHxLF5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809487; c=relaxed/simple;
	bh=IMJW+363IVg5kD8bsAouG7m9/UBKsClnNgoauqWSL/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dV5LacGRFguRFv9yW376GsUS3waIA5ZQPkRuMLLtX01W0EupQ9DbdGoJzA/IJ2PdGxng49KIp88nEGXRAZPsDan0FN1pTl5Pb3HA/wxs3M+eyno57TaWGXO8V4G2YYmGFNaKAaiJq2b9qXvyPuKMY92iDTn0uj/hf+Ng2OjBjj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyq12Y2r; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyq12Y2r"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb97e15bcbso215775666b.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 08:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739809484; x=1740414284; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6Me8ZURi9BHMA5VBv/dcrhQFM3Dtg/x5OSHUQbvC6g=;
        b=fyq12Y2rwf+770SkgC9kGgEjx5FZnPXXNbIXA4dzWzXvxTdwdFs/6k/R9pGXO2WycV
         BJPIo2kn8xCC/tRX0CsMYMooJ0jWh/qSpSSMMGxUTjqo8dUosw4JeFT1lN/OgdMiQ7iO
         Qpdf1AM1D7Q8ghZb1qH7MWyO2kLnVGlI7JCPKxqD8j3uHHeG8MXctufmlgFOMi/rNw9A
         xTn04RfkyPxFKTyyhtVrG04F9Qf0GO6ckcuQP93IAiIhj+4RsDITHXWmYVleaPWaD+5h
         rtWak9Eauwfqu00BfX6JqDld4GGWREXOQMJOW3dcyAYbpkSAnZ9pvmou4BV5W7F0WXlK
         ImOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809484; x=1740414284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6Me8ZURi9BHMA5VBv/dcrhQFM3Dtg/x5OSHUQbvC6g=;
        b=YFGzXhIKb8axi4e47eQGcCeyHt6B15wDSPEBEN0LuJYcC6JKFne+3AfDeZAiE9Rg57
         trsgCYw2YuhywRDsKFhZL5X6meXt6hWL/tGjSgUY1+hcXfcSi5qoGxee2hYcCTUdy/pL
         KkMJAIJ6I8rzDUszCKC3rRpwhdzIWWn6dcJjq2e38/nfS9zSWx7mg6QTgzbBv/ISYLta
         WpAX/Mf1NcaaJxhDNBVU/OwDxDb3jw9Y20h4hQz58r6B8WopUCnbW7xrzUh3EEubvegO
         f8OCJAZTKzJ4AjqKKnO3CZOU2go+IhaqKF9D6AX2NfJWLiHWsYuuksSzPZs4P7BHUz2F
         g0cA==
X-Forwarded-Encrypted: i=1; AJvYcCVjLLmBm+vbEwJJx1uR3c5fBdsjnUfEd7sNdKaLkT6WRFOpmkNS/0YX0bCLviySrryZgss=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvgVXKdwE2/8O5R3uJK9HpSP/85cn4DoMD6OIi5kYW2i+ymVoi
	tGQAfIcNftIW9h8rYB/VSn0X9LDycaEh3JzWSK2JjhYw9JZobHTM
X-Gm-Gg: ASbGncvqBLF5yy13nUF52UXi5LWvn5TqIVngiRJeXcBv5YJfKY2HnvEdRFv/CROfvuf
	ZRNkEl+8J6DqwBUrThgMB8/Imhf2IBmzmjFzNIZE76NAgIq1PTk93W7HHkjXdK2r+DXKS/YR5uL
	m/Ybx80GZrNlm4bs3aVzKGvCzxkNBbW7xNCkPirpm2m0up7ioE3NZ/USBQ+86Y86A4jIWaVDKvU
	OLEKnCSWvTLzeKIHDubWelhwGxXE36qgP6vnWzp69N0wSkxWGIbKgA5gpfAMhxZaOpNZMTTUo2a
	JGOdW0H7Fkj7mUgUJJjI/cP8GccIHQhfqfjc6nUE7YgE
X-Google-Smtp-Source: AGHT+IF485TpglsHoYcM2qPJw/DdadQMT0idtEVOh9tCPnUieChDKELqnF5ni403s2wOT43n83j0+A==
X-Received: by 2002:a17:907:1b04:b0:ab7:d66f:c86d with SMTP id a640c23a62f3a-abb70df5d76mr1030222066b.34.1739809483644;
        Mon, 17 Feb 2025 08:24:43 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb837378e7sm421915566b.52.2025.02.17.08.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 08:24:43 -0800 (PST)
Message-ID: <c6c5e039-7c86-4813-a880-89b864822d80@gmail.com>
Date: Mon, 17 Feb 2025 18:24:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: SOF: imx: fix a couple Smatch bugs
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 sound-open-firmware@alsa-project.org, Takashi Iwai <tiwai@suse.com>
References: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/17/2025 9:32 AM, Dan Carpenter wrote:
> Fix a couple of bugs which were detected using Smatch.
> (https://github.com/error27/smatch)
>
> Dan Carpenter (2):
>   ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
>     imx_parse_ioremap_memory()
>   ASoC: SOF: imx: Fix error code in probe()
>
>  sound/soc/sof/imx/imx-common.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
Thanks! For the whole series: Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
