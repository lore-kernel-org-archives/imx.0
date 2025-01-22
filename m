Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE472045B5
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534598; cv=none; b=HOR6dLRnagWL+P+XGiMZ59Dyf6yPCGZgyCnGQa1wffgyT73jC7hFgfyvgu3irE1kZKKPzeGkIJUx8MecyvE+RI6BQIBiRp442dLoe7YnTgwvbdiZHbE3BT6AZHF0s5SmACBH3wbeZMiIKuR+U/4oBmYp6QiCYYwxBG1shblWKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534598; c=relaxed/simple;
	bh=/tX+7Fy5cSnRoh3SFvELyGyWWn+cpGdNsJCXpeseT9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnhQoDqlwrg4k1HdxcgyoTpd+oKcfSYxFIHdlKmDjH3QLfUikgce9JAVlRmg02UE2e8q4Gf/F1wqZU6bQNV3waUvjbtXl8rLqYYiGUhh9Etk+vkGAsLLo3pqQ1cVH6sp527nkvAURfgrFDAzbypeqllVLM5x/f4v8P7dUIXP/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isJNUZDs; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isJNUZDs"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so8690605a91.2
        for <imx@lists.linux.dev>; Wed, 22 Jan 2025 00:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737534597; x=1738139397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tX+7Fy5cSnRoh3SFvELyGyWWn+cpGdNsJCXpeseT9w=;
        b=isJNUZDsh3uFNHDvMm3A0B4IZCwb2NvjZN9RH1kbEgZL2qaUFT1zfNdQbMorUuyExV
         72IO1DZEHnS5WFFZGTd4eg6b4UNXPPoEaezv8IbGqBVN/TkDe4758yJetE3t6CZ42FCu
         ftlTcZp5fBzuGmVK86vPOSVDXGus2GEmFOyjcd61KAC9dalUixSB2HSjJ432UKO7WYmh
         93unUb7RTh3wlvgU3kzdmd1lrAfsVD/MotNGlsjFgMreL4d+g8Kqsnd8AB3o949OHjW3
         B32mVf0JzEOTu1tW0eCtaU5VVaZKfSPf3NBg5D6UJc9aKljsrzT7OsKCVoosmvGz5YYw
         2H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737534597; x=1738139397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tX+7Fy5cSnRoh3SFvELyGyWWn+cpGdNsJCXpeseT9w=;
        b=AU7YxCvR0XniW864TlQdVJ9JDfFqAAoqFmtDkHEzr21GSOsvOP6fYmmcJmGFsttcpD
         bjjB/H2VIelprgvGdOW6OeIyplI9pwZFilmh5sMRPiKjGri+/iDgCfqK8lO1IuNbuqe1
         vcfJz/Fnu5lr843hS8R5yuzLUSOrY9H78pJizZo6IeffB97023gsZQPCahvH//tDYXBd
         HBTcO8lVJblbiF6UWV2ivU0QFc832V0ahzogbAjGQ3OOWWk62K3UDREBcmmdhhV5z27Y
         VVtoebcRJIAveCdkhkYIqt42PcfKk7czibaEziaQ6SKcaMKVUCwAol7WwW8ECPm3Ko5S
         XEcA==
X-Forwarded-Encrypted: i=1; AJvYcCUOWLCRKtfu9n5syDLgSRd8uYlTw2z4Ajft+La5OqwgJWiy9f00Kw2Sf6LO8c4kVDlUCnE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3DQKlUqv8BV0sdA33TTpShwOqX4+G+1ENNq4q4SX94SDuXQwY
	ByXyHznMewZonDHfJxVd9eZyE+HIA6/42I62DvqPF9giWcp5lx4KS86NG0e9HOUb8YCGaVvznaZ
	Gg8j5mbPUKqK1Q7LYvoVcfQ1Y218=
X-Gm-Gg: ASbGncsvag6JqlUh6dEcfCnsgrcYQKkgpWbNKq+7qnP1KzOGwuykFMrMP3rutcYSLPn
	oLTDHqInG7dmb6zOamnFvhPxEIC1mMfLlMnqqfMFgpITRYzk=
X-Google-Smtp-Source: AGHT+IFjNo4Ziz5HOfDmkBLJDQr0WPy+nzSKjWQJu2Upckf5ZkcCDWI9Xqhkj7l4u7vuHb/VOquDY/gNR2K/Is72F0w=
X-Received: by 2002:a17:90a:d00b:b0:2ee:a4f2:b311 with SMTP id
 98e67ed59e1d1-2f782c907ffmr29514751a91.8.1737534596714; Wed, 22 Jan 2025
 00:29:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250121181322.1278407-1-daniel.baluta@nxp.com>
In-Reply-To: <20250121181322.1278407-1-daniel.baluta@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Jan 2025 10:31:20 +0200
X-Gm-Features: AbW1kvbyizWsX7zmuqkfBCUIMaaxoroBm_U-y6Bd3bN5vuzm0HmUkcytm-UPP2I
Message-ID: <CAEnQRZAmb_j_fDrEHP=NaA6jv_tpZdsOLxVxziCf8Ax-GMbprw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8m: add SAI2,5,6,7
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: broonie@kernel.org, iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
	lgirdwood@gmail.com, imx@lists.linux.dev, 
	Alexander Boehm <aboehm@eurofunk.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 8:14=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> From: Alexander Boehm <aboehm@eurofunk.com>
>
> Added the remaining SAIs in addition to SAI1 and SAI3. There is no SAI4.
>
> Signed-off-by: Alexander Boehm <aboehm@eurofunk.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

I've resent this as v2 and added my SOB line.
