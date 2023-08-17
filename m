Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F9B12B97
	for <imx@lists.linux.dev>; Thu, 17 Aug 2023 20:27:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5254f9eda36so234480a12.1
        for <imx@lists.linux.dev>; Thu, 17 Aug 2023 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692304053; x=1692908853;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eWyoHdVpzt1zRr1GRv8UqrTP/z+FPQhDPSrZzKoUkUQ=;
        b=bO7sYaF3rx52bse8B7wwBHUSIg/AgT4PH1dhQwuxJbTk8DpK4Lzf36TMigDWfeJpzU
         wupN34v06mMWOrI8981S0G95pTk+cEdVYB8lidi3RUsGoEA9j+A9N5juyWke3E+5tZE9
         WuDFE6Ji4tNoNl38w/+AOMN+8Hg6dSD5R+QeF4QbvhY4itzp87Qwl4y3C7k7xlIQ4OF9
         ntsabM9Edfwrn7+DBYArQ504pr9MAMJDJMkNSEgu2MbmSPE+/tD5Ljz+OhbM5+7xSvH/
         6+1BMVBZXUOGwC2bgxFWeSmyn+TajUqAM/On12wZ4kh3YdWThRhLJVJx4sCDjfByBP7w
         USRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692304053; x=1692908853;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWyoHdVpzt1zRr1GRv8UqrTP/z+FPQhDPSrZzKoUkUQ=;
        b=YQoIyxXKTid6mjXT7fA9abeWRGbM9NnaSPHMS3OPFI/k1GK5OXtJNS1GpDaHYIVmK+
         axAr51SX5EoZLultDXiKb0rQKdlzVL/YG2/2mNBI+y6zoQB7YFuGZg1wQEmW5O1EIDL+
         D1Pc0QbeRz7SvcmxJPhrwwkD8bzEgW9aXkvnGpENEAjl0pXccjQbZOjELsQ9gKsM2/mB
         clXd0U5Yj58vf7WmhXgpemqK/RUYmiWbYmGiH+PWh7DuqH1nISZ60jFKk73QqB0nszLS
         1dBg9/PUxd+EtWzIBPD7UVlJAsdWVvspv/L/dqR1SVcn4YNziKcOQAZaxRbulvrg3wM6
         7+cQ==
X-Gm-Message-State: AOJu0YzBxUpLl2oqSQMZcKr7zxF38N8M/QOIO3/Qpiz54qsyiSE6LZaV
	5zfIQAGXwWd8rvVKoriN4gUgtSftDuDI85UBU4mwbSCq3I8=
X-Google-Smtp-Source: AGHT+IF7XTAQOBi3U+VTsaMTHZtdilP5tuBRwNBstD74orTC8jb1s0uDH/qSz12mxaxoMiNx0ORgocUNa3aBnQYBPAU=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:898:b0:522:ba6c:9b1b with SMTP id
 e24-20020a056402089800b00522ba6c9b1bmr622616edy.26.1692304052932; Thu, 17 Aug
 2023 13:27:32 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Aug 2023 13:27:32 -0700
In-Reply-To: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
References: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Thu, 17 Aug 2023 13:27:32 -0700
Message-ID: <CAC5d1WK_xGZirvgjd+JE4Lj81+T69OW_X_apf4ioEi9A6po1mQ@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > > > > > Browser extension test thread for quick email replies.
> >
> >
> > > > > > Please Ignore.


testing popup staying open

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
