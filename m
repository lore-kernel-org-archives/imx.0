Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2C96125
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 17:49:20 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-3a7ca8720a0so1441009b6e.2
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692467359; x=1693072159;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uS4n2szZFtpmsdtNRtWNt0w24h56fde3gVB+QL49D80=;
        b=qIrH7eKwEXJrRvVKVn6RtswHObAkHXVFZK4vh1iendCHsiJ7rXELtVsS3Sssm+kTzc
         zU+9f1FhJLCrjYUUgJ6gsOqPPvusGgPTmLcJ+BK79Qr90WgfGogye/qQD9ZpQxD94lcQ
         /CBsJN1K5jaZUzdI55IoCb5ypBzg14454Mtem19MFqDOgHhRuj8+6VVPlHHIf+19qY5Y
         6OZdroz48pln5TJFExqf5r8icEyZuM3eTP2vsKlK3N9kcsQm/cgvisXpGvyDGc9OkvbH
         RFlMieNGwbo2c89D/qGenmnbkdrdqfrSMwaD8SFJyTs0e3CPyAZ5v+NOVYjDHI060qZH
         gLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692467359; x=1693072159;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uS4n2szZFtpmsdtNRtWNt0w24h56fde3gVB+QL49D80=;
        b=jLL5rkXIpqXXjJ5YWx9zCfvVs5dig515RGoZ6jNFTVSWVw6ArQKiDocVngFfu4Wl4x
         /zl+q5HwCSXbIS9EQYcaB5gWJLLNPM10vu7OEtYfMqF+pJqfQxNRXNxJVv8bb5ZwDa+A
         h35X7K5u7WkcemzGgTu21QoTv9/w1ODTDePtItRY/XxHRBgI0GGo6aQeGroYL20SeRqp
         ctqj+wpjaLXUtsjFcFqFzPi9PAC0MRaWF1KzO+vFCHIWFYaJVaV+jRgS3eb+RmpXYH7P
         beR2sq+3rMUgailfThabMQ6HP1KKDxjNzRM18c1Ne3eHZWkqqk56QePFxBRYXLtjwRTY
         n6lw==
X-Gm-Message-State: AOJu0YwCZfQAE4KF5yhf6TTUnpr1k5cRupTaV8i2wdAGuWRDT7yHMMlr
	cqg+zz3FaJgY2RrOhqkiQ/jL9Q9qextglS/qV+Q=
X-Google-Smtp-Source: AGHT+IH4SqTbT0AnJ4tmfsBEPIdgfWiO+dew5Fu+KEF77t2KZ0Y3jd6ZszjMupCnfdkKLeuhbCihD0cE0bytJnQww8s=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:21a8:b0:3a7:6213:6899 with SMTP id
 be40-20020a05680821a800b003a762136899mr4120739oib.24.1692467359082; Sat, 19
 Aug 2023 10:49:19 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 17:49:18 +0000
In-Reply-To: <CAC5d1WLrThbisd8+8TgYcC6TVdeYey7f5dQtha0YWKDeoxkB7A@mail.gmail.com>
References: <CAC5d1WLrThbisd8+8TgYcC6TVdeYey7f5dQtha0YWKDeoxkB7A@mail.gmail.com>
From: 0x520.eth@gmail.com
Date: Sat, 19 Aug 2023 17:49:18 +0000
Message-ID: <CAAsV2_ix84gwMZ9kyqj5r+xL5kUKvY3Y0Nf_D8ZX9Dst7CP0=g@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

test options loading.


==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
