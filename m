Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B64A16
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 16:17:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso2763010e87.2
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692461823; x=1693066623;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8kfRSzqKkVlj2np09YaYT/fyo2KkXTE6JWvICJeu8WA=;
        b=ZvRj8wZZnY4JPFID9KBbpdOpmDedzB+hnDMJMewhzikiRWpf4LsUyeffTGzJ1fL+vY
         c90FjAxzRQpRKN0eBUiP7rfeIi0pXELuvlP6puEw7BPdJiOjqpydA1uWSqWnVYsmdApd
         94KtjYPjwjyKxHWxcg6DmnsfrpzmthRlBxQbSK7t/DgRD7lEsSacRe1QA5+He8uPeH2L
         oT9abcQAUBinLn5eBI9FWMOVvxVlSsQCMRaBPkHHfWW5Ii2M0jWPnJzvT54KvBNME9Fa
         mUpicC25LlxQift/aPJzlafOESNbaw9drunYL+ipJ/Q62gOlXuRdBLC1wjzMMWXzY/1L
         DCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692461823; x=1693066623;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kfRSzqKkVlj2np09YaYT/fyo2KkXTE6JWvICJeu8WA=;
        b=WH307+S8keDCE/nMf+RST4gKtWpkgCqCtCEWXeO1Ve6Q5eavUuOANU63FmhMvvmb2Y
         CduBuXXk/lquskyhPmbdfSQX4E0heAZrbTClod1Es/B97afwc2qTIcwTPTg8pNJPNWKx
         iQkJbDBlacLHxXAz5UhKreDIBQZldWAmiYhJoaDlolBMEonDIcdhINslG4QZHvds+Col
         BjqPs+vw5t5yrdNG4hJrPud9bcrPi8QFy+xQVzilxVzkbi3b2zI9hY59AQpDAE6tcEzg
         DWo+pqfXi8id0NhZpFDYJadaAbHQ7UTPcvK8IEW0HXoK144Z6NK9aL7JorLvXdfFGzht
         ymnQ==
X-Gm-Message-State: AOJu0YxMXKHmWKYq7Ow2+oCRuMxl+MC/fDqJNVtEj6UBYZry82o4aydr
	H1uItVItws1Nf8I/96Ons+IHt6JOx5Dd/7utB5k=
X-Google-Smtp-Source: AGHT+IFTQCUlQd0/kvwjBduTsf3hn1OYTzoI1qur2ZTY6/BPpcFmaunHR8CR+vYAYqCnLm1CAmCYXZ12z0S4n4GzR1E=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6512:532:b0:4f8:ff52:93b7 with SMTP id
 o18-20020a056512053200b004f8ff5293b7mr1572443lfc.30.1692461822812; Sat, 19
 Aug 2023 09:17:02 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 09:17:02 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
References: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Date: Sat, 19 Aug 2023 09:17:02 -0700
Message-ID: <CAC5d1WJ7QfxUVptFj-ANN8PEsBxhtunfJ28-nKFguFiUxfcP2Q@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

testing chrome storage
Acked-by: Qi Wang <harrynicomama@gmail.com>


==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
