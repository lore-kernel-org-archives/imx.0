Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E84EA1
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 03:35:12 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1c26bb27feeso914027fac.0
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 20:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691811312; x=1692416112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/nJ0DfHR+CjdLlvOGWiCZujl8L4ft6T+az/jZ3U+UvU=;
        b=skhvE3O36JD99SDgg+NqrD81AAnFmGvPJrvkoBREImWcn9C1owrYO09BlQ88Nc9yyL
         bE65B4cFbmI5XbmN5EcYxn96tnrwDWcwreWmKgOurQvY4lsne19CixYNCYwsdY9r9MS/
         WRak7kM+2HCojf5XSkI+4rZv5oQvDijFKf0wtGUCwRaDZe87brqXqHKkQSTSEok3/j5C
         0ndHAmRpWFqPh+DoUiZgQbAEKUtQXZU99PLSfhUkJ+nzLnCbZU1swPwuZs64PskKyXas
         SpwUA35vcJgVHtpUiUCSysF3X72SjURoqyEA97ABV208lKW2NrSfwhlKRUIW75HvvJsP
         4AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691811312; x=1692416112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nJ0DfHR+CjdLlvOGWiCZujl8L4ft6T+az/jZ3U+UvU=;
        b=FZ5v2Jtg8PkFOKNWSuHX3Bd55cRmr3HCvUdUyVAzPlDx0oXnOBDMy9UnaNlUZKh+cE
         tLLx3cXQkYpg6zZ/cwFrdTh5I7NhoCuwS398JRdHX+e95F5RaLHz4yXA5LsIj2IeIvGi
         QX5tbEBBgafVBiSil1x+8r4cRxqYkhv28dsG57Bxn/sal2PQrbDvcT/IpHp6ai2aNwOr
         dcMWtJenUPYwpByLbK8P5HmM4WmNoH+JwX0/++ll4RsrolNEOCB9n6DRX7dz8riTVS2F
         8rdpUU2wOmFKbBMohwsvWC7ZJR+9ewXfAzic9+TuEkb5jO8sVl9vRn1nWesCxvkWYd0h
         PBsg==
X-Gm-Message-State: AOJu0Ywi3UDqLARj8df1tlCIwNXKCoZrY5cvq2CvJXM8ZtjDw0qfnNbC
	wcxCOk/xH8vLCGmwE5bkHDxNJZc2V2A2tsX6udKrlyPDHQV+8tlU
X-Google-Smtp-Source: AGHT+IHMkwiCWZEr38R+gD8eyIgVSIJX199GnT9Jj2OvYCCWMo1pSqFZusXsb30queichWz1Q+s5xg/In5HODRaRw0s=
X-Received: by 2002:a05:6870:c6a5:b0:1bb:b025:3e87 with SMTP id
 cv37-20020a056870c6a500b001bbb0253e87mr3996212oab.58.1691811311771; Fri, 11
 Aug 2023 20:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Extension Test <extensiontest66@gmail.com>
Date: Fri, 11 Aug 2023 22:35:00 -0500
Message-ID: <CACRdBt-5L+r88m2nGdKFo+zk8H0VKT67UKSATtO1FK2OZsyywg@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Browser extension test thread for quick email replies.

Please Ignore.
