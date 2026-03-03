Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4164DA556
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554993; cv=none; b=NDaxiunH3h39ezW7jeev8QGKI8doqkR/tmW5GK3BfT/uPxa8+yN20ge0RekH23FacPTb6Cv+EW/6MOUZAXXxWR4DCwiUQ9cK+QpSxrGdj2Uc39Zz2pvDJhXXWiekGDPrk0YwuWXJY3Jx4fqZGrrLoMFR4SvT53AKsb4EdDGzz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554993; c=relaxed/simple;
	bh=QnDe6CqK7d7iv5p2X8yN4ClZilCQfBmh+Ih5CDsKBrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwUX2E08XHZqZkyDB6Kux/OWrmwdDoHvltxNpEP/KAjXxJSaCYGR3u72vgfAqUIds0ReKNpTyExcX+id93vOP3V0wrJRzw08mNzN9SlxvFIrGFzXc1bafrTcKBXXZ9Bwyp76cB09OE/NyFAvv+3UwN6bKYNyOe8pzRjvJaRnVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7cOzEeN; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7cOzEeN"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5100751eec.0
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772554987; x=1773159787; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=i7cOzEeNjS5AoJiPVYHZw8vbBzxmY7/IMWJCfQM3wO4Uew9OzOY+txP716GhcwIbKv
         4+tvmsp/PLqhjpNl3cwOti8YMTH6bWlmdMeapW3LFS+fk4gII2vCOhdQL3L1iEub/35g
         auJi2oU80ySBQK9C50ezUix8cl2Fv2oDpRukvRKWWqiCzYf8ZxMN4uioSjfxme+DTjxA
         X042jFdl3CC86pJrI8lmpOyImzQqcTckBoWOliI+bgt5NzUTEXtxrnyRt5+kV/+u4K9/
         fRxwWh9WrN/+csnNbQsJvqyuEUGmvgxqNkLF4IgaNxdQwDozponRdlxNjRAO7un85zTN
         1INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772554987; x=1773159787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=IkVPtyZVWyj808ZkiIjTRAoOg+ucYsG3WouKTvwwUWVQ586a+Wm8NSNNO2YouDHuVv
         engt7SSiEZ1FgDIq4PbHjPjhe/AGYe5oPt5H3x/SYx/FpP7cAjqlIDHQ53wdUEslF4dI
         k3SuMM6+lNpoyf3Vwafd63RkR2FVjB7zAOwoCKmZhPO2NMlLgbnMYA+U8FsFvPoSk5CE
         tOlnewqvWsin2/X7fBJ/tNRynJ+b0rekYUTVMf1klHAY2JHXWHYnodfrGWKIZ2CoMu1L
         z2YHiDENmkOSsVtu6ro7ZI3l4UCMxzA9LhNWtnrVdWrKgT+0ZA0E0gnpzQoK/Wa3apWN
         U3mg==
X-Forwarded-Encrypted: i=1; AJvYcCVgTzMA4O05G/xBLV+qctXuiWRY/zCO6vZxE4Iz0pCNGgx8AvaLTtFgN33w8AwoRueNnNI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyzMjXy/qJrAdz/MGIVDCnmr8DiFMqVTLiQ4yC36jRfaOaasBz
	D+6zQN2aZMYoy448wor6tR4aaRExYKvKeU9AE71iqdIfhvQdj8ryjQgd
X-Gm-Gg: ATEYQzwKYAEzWID+J6rwWY4zfVHUJ5kAIufHCIsTTybLdDy+2WrbUo6pWXvHX2vXK59
	BYi4GQTPxpnUv4RCS6fByyKFvS2OWQf1lEFyADscrfzhp70X6GLkCYgnfUxGgUJQMEWATHuz57q
	iws9SvtSgCWeOk84K3Un27lXpYKmNCFvwAsK7dMFJc1EaxarC/nVIy4A3Z3hv86M1QwzRo+on1g
	/SrUpTz0+GkaKyPE8Uo36wJudcrgdQIKuD5d1mjDMydL9Vmne0XA0d52WkAhh0ahjwVLK2380uU
	GwLxsfVGAvUa8643kH+nEeLOlSlhzEAFnYQo+HEogg0BstWtWGvdcko+gtB4Dw0KRBoQn9jEXfY
	okKRWwuxiCv4QpL/hzWTtnd8E3RZUKs1Qy5TihZLeYgpRMS7iNSTKTx1TuJocFsPdmvb7Uu4gOS
	l7LOuYNmevaPjQEcC6uFOBVFNeS0LfUpuktBPU4T2K6rzxibQ=
X-Received: by 2002:a05:693c:8151:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2be2b170190mr181320eec.13.1772554986631;
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cefd7esm14967005eec.9.2026.03.03.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 08:23:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, srini@kernel.org,
	s.nawrocki@samsung.com, nuno.sa@analog.com,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
Message-ID: <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>

On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
> 
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
