Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62905CA5A
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560650; cv=none; b=kuhqc0n9f7w+s2OmAVg5YIc9L7ZTRpCY9HLZiyOig40cLVC8MIz1nEUWh7ZuuwumkhxlzNVSHG4yOqkwlfGNqEiMgv7naxOHYYRz7DV1kY6DGalpqYnAX1IA0moY8hoBaScm7ikvQJTStlwIH2ap7KyQXtD6Zs8zzzJ73rxYyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560650; c=relaxed/simple;
	bh=Or6QuG77bV09z00Zjh/yMMBjENRVafR4XgVliURaVO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pS8fIacqsZOIHQxJqyg8CnsQ/aKfiAxzLZWDGvXrsEcAZ7+jPg4F0oit0f36YrFwNbtEOL0fVsnNrWNhJD2oCywkO8vGQkDcfGlGZleAfODc3QG9YVxbh4I8gOkQGEe+wnJTsE8nIRJqznRumBbV3u+kB9Tpi/ROWTDMBMmcIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa1WKTKH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa1WKTKH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54acc04516fso1727082e87.0
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742560646; x=1743165446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or6QuG77bV09z00Zjh/yMMBjENRVafR4XgVliURaVO8=;
        b=Qa1WKTKHWZ4oIFIW48lGF7eCGmxt6wDyZy2rv9oVxjP9BVl5tdylq58qQQX+jzbQ9o
         0QzjWz4aphg/kWUmSQOmrGuPBtaUFLSPO/xTUkev+Pf/uZHUQc+GqoaE3nL2yqUCwuQc
         FwCuzYB2d2WiNDidXdDAazx93F7NS/gD9ZgteGPfvnrIMGmFw8n45wcsRE8EL4caLZyF
         avCktbAr4CDR+p0MH2UwDefd3f/nlBAUf/qka8hBxW6k7quWSZDx2BMSqgRpkf+wfhzr
         fWPhOnQWWcglLUZKfz6FJ0t35UGwGOdK41OMGJuBrlIP+Vxc9Ch9ffUYK9gzoUZ9RiFs
         jaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560646; x=1743165446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Or6QuG77bV09z00Zjh/yMMBjENRVafR4XgVliURaVO8=;
        b=KU5NxiM91i8Lc2rovN7YMu9CIVOveJUk9sfILo7WAWqiuaJ+3aEap1XcSpgvKp0lx3
         ULxQdbW1mjr4MB0CKA75Mh1+/WJW9gVr5uBILqe+kj5Ty8VpHOUsEyF/QKS+YNsj7RZ5
         0jN8jiqP6R9X6D6DYET4Jzzm2gnxwnxH15bCjZtghdWwE69U2WOMSUT1ihNtxwZL5WV/
         ROGuppCNUY76YWyoKlNO9Q8ZeTsD5cTjWtc46ZT1uFCC/A46oERDWDIMEEKGkQGh8F07
         aFxFGUNBF8Hl5xAHPiQqZFeA45KKnPVkrcMeOEeKDSjp4SYyS+aN1hpZLWcsxs8GEzzB
         Kehg==
X-Forwarded-Encrypted: i=1; AJvYcCVwMGDNEKy5MyvF0hW5iOtwCz9ev5U/y1NXGpRVCp2HSD9DSwoNIJdgTSbTj7UX/ohJNeM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCy8X4rs8H3UZjZGOy2eqaIuvHorcYKoMdhKr6Rg/hcEcN9ba+
	dj9JMpQNdwuFIbLFr9aWOGGiqHxikyS6OVvLRQw950ySb7uWoRyoC/qn2ttbEaB7UMzUY3VKeJ8
	8KOoh+zibfugEN0TCMic/03rdkic=
X-Gm-Gg: ASbGncudjzmp1C5lrn0c6Vo0F5fnMwxzTQdOcsTC6nzU/pG8aEWX6Qkf+HNHeE+Zmj9
	MqjTjyPo7X94Uo98ALsmdCOoMG1FGA0bPT7xE3M1QfiOW3oc8KoHIgjrUJzWknUFr07VuIpOEGz
	WqFURHmR4qKd8AJWfKN5o7s1OHXyszsE3BBKv06xIBs2qpgRlGms/oHWN0xA==
X-Google-Smtp-Source: AGHT+IF5ZhvHNp9WkOfM+Q8diZfXaNlHoCdnWVMGrImaIEqIs1NM7JfBS6ONLUiVtVtJjKYMBeXX2rGQei/E5BktgGw=
X-Received: by 2002:a05:6512:12cb:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-54ad650348fmr1331856e87.52.1742560646266; Fri, 21 Mar 2025
 05:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321073950.108820-1-sherry.sun@nxp.com>
In-Reply-To: <20250321073950.108820-1-sherry.sun@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 21 Mar 2025 09:37:14 -0300
X-Gm-Features: AQ5f1JoXo2ejsWQ1aGN1zM--X22HsVKpWU6VSj_zLDkLidKs307tqtN72kTPvf4
Message-ID: <CAOMZO5Bo82YfE-4S=FboLhg5yJPFmGVKjx4XmYuf8MLZYLRgZQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/3] tty: serial: fsl_lpuart: cleanup lpuart driver
To: Sherry Sun <sherry.sun@nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:42=E2=80=AFAM Sherry Sun <sherry.sun@nxp.com> wro=
te:
>
> Do some cleanup for lpuart driver, no functionality change.
>
> Changes in V4:
> 1. Fix unused variable 'sport' warning in patch#2 reported by kernel test=
 robot.

For the series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
